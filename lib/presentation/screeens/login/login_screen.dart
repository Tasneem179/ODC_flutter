import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc11/business_logic/auth/login/login_cubit.dart';
import 'package:odc11/data/data_provider/local/cache_helper.dart';
import 'package:odc11/presentation/constants/app_assets.dart';
import 'package:odc11/presentation/screeens/app_layout/app_layout.dart';
import 'package:odc11/presentation/screeens/signup/signup_screen.dart';
import 'package:odc11/presentation/styles/colors.dart';
import 'package:odc11/presentation/widgets/custom_text_form_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../constants/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          token = state.loginModel.accessToken!;
          CacheHelper.put(key: tokenKey, value: token).then((value) {
            showTopSnackBar(
                context, CustomSnackBar.success(message: 'Welcome Back !'));
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AppLayout(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        LoginCubit myCubit = LoginCubit.get(context);
        return Scaffold(
            body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 30),
          child: Form(
            key: myCubit.loginKey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height / 30),
                  child: Image.asset(
                    odcImagePng,
                    height: size.height / 11,
                    width: size.width / 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Row(
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 40),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Email';
                    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
                        .hasMatch(value)) {
                      return 'Please Enter Valid as example@gmail.com';
                    }
                  },
                  hintText: 'Email',
                  controller: emailController,
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                CustomTextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                  },
                  hintText: 'Password',
                  controller: passwordController,
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget password?',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (myCubit.loginKey.currentState!.validate()) {
                      myCubit.login(
                          email: emailController.value.text.trim(),
                          password: passwordController.value.text.trim(),
                          loginError: (String msg) {
                            showTopSnackBar(
                                context, CustomSnackBar.error(message: msg));
                          });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppLayout(),
                          ),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 50),
                      child: const Text('OR'),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ));
                  },
                  child: const Text(
                    'Sign Up',
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
