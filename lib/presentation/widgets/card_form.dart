import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../main.dart';


Widget cardForm(String s1,String s2,String s3,String s4,String s5){
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s1,
              style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Icon(Icons.timer, color: Colors.black),
                Text(
                  "2hr",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                )
              ],
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      s5,
                      style: GoogleFonts.poppins(
                          color: Colors.black26,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      Text(s2,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),)
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "start time",
                      style: GoogleFonts.poppins(
                          color: Colors.black26,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.timer,color:Colors.grey[200]),
                      Text(s3,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),)
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "End time",
                      style: GoogleFonts.poppins(
                          color: Colors.black26,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.timer,color:Colors.grey[200]),
                      Text(s4,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );


}