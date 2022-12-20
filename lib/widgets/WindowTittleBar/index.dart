import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:test_project/theme/colors.dart';
import 'package:test_project/theme/images.dart';

import '../CustomTextWidget/index.dart';
import '../WindowsButtons/index.dart';

class WindowTittleBarBox extends StatelessWidget {
  bool isclose;
   WindowTittleBarBox({
    Key? key,
    this.isclose=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        color: CustomColor.PrimaryColor,
        child: Row(
          children: [
             Image.asset(Images.logo2),
            Expanded(child: MoveWindow(child: Container(
            padding: EdgeInsets.only(top: 5,left: 5),
            child: CustomTextWidget(text: "TIME LOGGER",textColor: Colors.white,)),)),  WindowButtons(isclose:isclose)],
        ),
      ),
    );
  }
}