// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:odc11/business_logic/lectures/student_lecture_cubit.dart';
// import 'package:odc11/business_logic/lectures/student_lecture_state.dart';
// import 'package:odc11/presentation/screeens/app_layout/app_layout.dart';
//
// import '../../widgets/card_form.dart';
//
// class LecturesScreen extends StatelessWidget {
//    LecturesScreen({Key? key}) : super(key: key);
//
//
//   List<String> lecturesName = ['Flutter', 'React', 'Vue'];
//   List<String> lecturesDay = ['Wednesday', 'Thrusday', 'Thrusday'];
//   List<String> lecturesStart = ['12:00pm', '12:00pm', '2:00pm'];
//   List<String> lecturesEnd = ['2:00pm', '2:00pm', '4:00pm'];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => StudentLectureCubit()..getSection(),
//       child: BlocConsumer<StudentLectureCubit, StudentLectureStatus>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           StudentLectureCubit myCubit = StudentLectureCubit.get(context);
//           return myCubit.studentLectureModel == null
//               ?  const Center(child: CircularProgressIndicator())
//               : MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Colors.white,
//                 leading: InkWell(
//                   onTap: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  AppLayout()),
//                     );
//                   },
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     color:Colors.grey[200],
//                   ),
//                 ),
//                 title: Center(
//                     child: Text(
//                       "Lectures",
//                       style: GoogleFonts.poppins(
//                           color: Colors.black87,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700),
//                     )),
//                 actions: [
//                   Icon(
//                     Icons.filter_alt,
//                     color: Colors.grey[200],
//                     size: 35,
//                   )
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height,
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   child:
//                   ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: myCubit.studentLectureModel!.lectures.length,
//                       itemBuilder: (BuildContext context, index) {
//                         return cardForm(
//                             myCubit.studentLectureModel!.lectures[index].lectureSubject
//                                 .toString(),
//                             myCubit.studentLectureModel!.lectures[index].lectureDate.toString(),
//                             myCubit.studentLectureModel!.lectures[index].lectureStartTime.toString(),
//                             myCubit.studentLectureModel!.lectures[index].lectureEndTime.toString(),
//                             "Lecture Day");
//                       })
//                   ,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';
import '../../styles/colors.dart';

class LecturesScreen extends StatefulWidget {
  // const LecturesScreen({super.key});

  @override
  State<LecturesScreen> createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  List<String> lecturesName = ['Flutter', 'React', 'Vue'];
  List<String> lecturesDay = ['Wednesday', 'Thrusday', 'Thrusday'];
  List<int> lecturesStart = [12,12,2];
  List<int> lecturesEnd = [2,2,4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Lectures",
            style: TextStyle(color: black, fontSize: 25),
          ),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton<Text>(
                icon: const Icon(
                  Icons.filter_alt,
                  size: 31,
                  color: primaryColor,
                ),
                onSelected: (v) {},
                itemBuilder: (BuildContext context) =>
                const <PopupMenuEntry<Text>>[
                  PopupMenuItem(
                    child: Text('All Lectures'),
                  ),
                  PopupMenuItem(
                    child: Text('Finished Lectures'),
                  ),
                  PopupMenuItem(
                    child: Text('Remaining Lectures'),
                  ),
                ]),
          ],
          leading: IconButton(
            onPressed: () {
              return Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded,
                color: primaryColor, size: 30),
          ),
        ),
        body: ListView.builder(
            itemCount: lecturesName.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${lecturesName[index]} ',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.timer),
                                  Text(
                                    '2 hrs',
                                    style: const TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Lecture Day',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text('Start Time',
                                  style: TextStyle(color: Colors.grey)),
                              Text('End Time',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  Text(' ${lecturesDay[index]}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: Colors.green.shade200,
                                  ),
                                  Text('${lecturesStart[index]}:00pm'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: Colors.red.shade200,
                                  ),
                                  Text('${lecturesEnd[index]}:00pm'),
                                ],
                              ),
                            ],
                          )
                        ]),
                      )));
            }));
  }
}

