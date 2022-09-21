import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc11/business_logic/terms/terms_cubit.dart';
import 'package:odc11/business_logic/terms/terms_state.dart';
import 'package:odc11/presentation/screeens/settings/settings_screen.dart';
import 'package:odc11/presentation/styles/colors.dart';
import 'package:odc11/presentation/views/custom_text.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../app_layout/app_layout.dart';


//This screen use for get terms and conditions
class TermsScreen extends StatelessWidget
{
  const TermsScreen({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => TermsCubit()..getTermsConditions(),

      child:  BlocConsumer<TermsCubit,TermsState>(
        listener: (BuildContext context, state) {},

        builder: (BuildContext context, Object? state)
        {
          TermsCubit termsCubit = TermsCubit.get(context);

          return Scaffold(
           appBar: AppBar(
              backgroundColor: transparent,
              elevation: 0,
              centerTitle: true,
              title: CustomText(
                text: "Term & Conditions",
                fontSize: 28,
                weight: FontWeight.w500,
                textColor: Colors.black,
              ),
              leading: IconButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: black, size: 30),
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: (state is !TermsLoading &&
                              termsCubit.termsModel?.terms == null)
                              ? const Center(child: CircularProgressIndicator())
                              : RichText(
                                textAlign: TextAlign.center,
                                text: HTML.toTextSpan(
                                context,
                                termsCubit.termsModel?.terms,
                                defaultTextStyle: const TextStyle(

                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff555555),

                                  decoration: TextDecoration.none,
                                  fontSize: 17.0,

                                ),

                              ))),

                    ],
                  ),
                ),
              ),
            ),
          );
        },),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       elevation: 0,
  //       backgroundColor: transparent,
  //       title: CustomText(
  //         text: "Terms & Conditons",
  //         fontSize: 28,
  //         weight: FontWeight.w500,
  //         textColor: Colors.black,
  //       ),
  //       leading: IconButton(
  //         onPressed: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => AppLayout(),
  //               ));
  //         },
  //         icon: const Icon(Icons.arrow_back_ios_rounded,
  //             color: Colors.black, size: 30),
  //       ),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Container(
  //         width: double.infinity,
  //         height: double.infinity,
  //         child:Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text("Terms and conditions are very broad in the abstract sense. However, they contain more specific provisions depending upon the contract size, industry, and complexity. You will find that there are standard components included across several types of terms and conditions.",
  //             style: TextStyle(
  //                 letterSpacing: 10,
  //                 fontSize: 20
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }


}
