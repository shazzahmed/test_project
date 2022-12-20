

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:test_project/theme/colors.dart';

final buttonColors = WindowButtonColors(
    iconNormal: Colors.white54,
    mouseOver: CustomColor.PrimaryColor,
    mouseDown: const Color(0xFF805306),
    iconMouseOver: Colors.white54,
    iconMouseDown: Colors.white54,);

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: Colors.white54,
    iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  bool isclose;
   WindowButtons({Key? key,this.isclose=false}) : super(key: key);

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }
   void naivagetToBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        // appWindow.isMaximized
        //     ? RestoreWindowButton(
        //         colors: buttonColors,
        //         onPressed: maximizeOrRestore,
        //       )
        //     : MaximizeWindowButton(
        //         colors: buttonColors,
        //         onPressed: maximizeOrRestore,
        //       ),
        CloseWindowButton(colors: closeButtonColors,onPressed:widget.isclose!=true? naivagetToBack :(){appWindow.close();}),
      ],
    );
  }
}
