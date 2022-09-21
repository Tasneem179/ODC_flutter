import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc11/business_logic/news/news_cubit.dart';
import 'package:odc11/presentation/screeens/app_layout/app_layout.dart';
import 'package:odc11/presentation/screeens/home/home_screen.dart';
import 'package:odc11/presentation/screeens/settings/settings_screen.dart';
import 'package:odc11/presentation/styles/colors.dart';
import 'package:odc11/presentation/views/custom_text.dart';
import 'package:odc11/presentation/views/news_card.dart';

//This screen use for get news
// class NewsScreen extends StatelessWidget {
//   const NewsScreen({Key? key}) : super(key: key);
//
//   /// TODO : Layout Screen widgets with Dummy Data by replacing with progress Indicator.
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewsCubit, NewsState>(
//       builder: (context, state) {
//         NewsCubit myCubit = NewsCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             centerTitle: true,
//             title: CustomText(
//               text: "News",
//               fontSize: 28,
//               weight: FontWeight.w500,
//               textColor: Colors.black,
//             ),
//           ),
//           body: ConditionalBuilder(
//             condition:
//                 myCubit.newsModel != null && myCubit.newsModel!.news.isNotEmpty,
//             builder: (context) {
//               return SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(children: [
//                   SizedBox(height: 8),
//                   Expanded(
//                       child: ListView.builder(
//                     itemCount: myCubit.newsModel!.news.length,
//                     itemBuilder: (context, index) {
//                       return NewsCard(
//                         news: myCubit.newsModel!.news[index],
//                       );
//                     },
//                   ))
//                 ]),
//               );
//             },
//             fallback: (context) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: primaryColor,
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Text(
                  "News",
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Padding(padding: EdgeInsetsDirectional.all(10)),
                SizedBox(
                  width: 380,
                  height: 300,
                  child: Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ODCs",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                              SizedBox(
                                width: 100,
                                height: 50,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: primaryColor,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                          padding: EdgeInsetsDirectional.all(5)),
                                      VerticalDivider(
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.copy_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Orange ",
                              style: GoogleFonts.poppins(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28),
                            ),
                            Text(
                              "Digital Center",
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "ODS Support All Universites",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}

