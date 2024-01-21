import 'package:flutter/material.dart';
import 'package:animated_digit/animated_digit.dart';

class canWidget extends StatelessWidget {

   canWidget({super.key,required this.controller,required this.textname,required this.icon,required this.suffix,required this.value});

  final AnimatedDigitController controller;
  final String textname;
  final Icon icon;
  final String suffix;
  final value;


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 85,
      width: 160,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 20),
        color: Color.fromARGB(255, 35, 35, 37),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
            child:icon
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      textname,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                value ==-9999 ? SizedBox():
                AnimatedDigitWidget(
                  controller: controller,
                 // suffix: suffix,

                  textStyle: TextStyle(color: Color(0xFF00E676), fontSize: 22),

                  // fractionDigits:
                  //     1, // number of decimal places reserved, not rounded
                  enableSeparator: true, // like this 10,240.98
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}