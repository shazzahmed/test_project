


import 'package:flutter/material.dart';
import 'package:test_project/theme/colors.dart';

class CustomInputText extends StatelessWidget {
   CustomInputText({
    required this.label,
    Key? key,
    required this.size,
  }) : super(key: key);
  final String label;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: size.width * 0.43,
      height: 40,
      // margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        scrollPadding: EdgeInsets.zero,
        decoration:  InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade400),
          contentPadding: EdgeInsets.only(left: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: CustomColor.PrimaryColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
          ),
        ),
      ),
    );
  }
}
