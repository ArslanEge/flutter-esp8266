import 'package:flutter/material.dart';

// ignore: must_be_immutable
class circleWigit extends StatelessWidget {
  circleWigit(
      {super.key,
      required this.textname,
      required this.icon,
      required this.value,
      required this.suffix,
      required this.canvalue});

  final String textname;
  final Icon icon;
  final double value;
  final String suffix;
  var canvalue;

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
    shape: BoxShape.circle, // Use BoxShape.circle for a circular shape
  ),
      child: Column(
        children: [
          
          icon,
          
          Text(
            textname,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          canvalue==-1 ?SizedBox():
          Text(
            (value).toString() + suffix,
            style:TextStyle(color: Color(0xFF00E676), fontSize: 12),

          ),
        ],
      ),
    );
  }
}
