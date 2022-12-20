


import 'package:flutter/material.dart';
// import 'package:timelogger/theme/colors.dart';

import '../CustomTextWidget/index.dart';

class ButtonWidget extends StatelessWidget {
   ButtonWidget({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String text;
  Function? onTap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.43,
         height: 40,
        color: color,
        child: CustomTextWidget(
          text:text,
          textColor: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}