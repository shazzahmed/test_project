import "package:flutter/material.dart";

class CustomTextWidget extends StatelessWidget {
  String text;
  double? fontSize;
  int? numberOfLines;
  Color? textColor;
  String? fontFamily;
  FontWeight? fontWeight;
  double? letterSpacing;
  FontStyle? fontStyle;
  List<Shadow>? shadows;
  TextAlign? textAlign;
  TextDecoration? decoration;
  Color? decorationColor;
  BoxFit? fitHeight;
  bool? fittedBoxEnbl;
  double? decorationThickness;
  CustomTextWidget({
    Key? key,
    required this.text,
    this.fontSize,
    this.numberOfLines,
    this.textColor,
    this.fontFamily,
    this.fontWeight,
    this.letterSpacing,
    this.shadows,
    this.fontStyle,
    this.textAlign,
    this.decoration,
    this.decorationColor,
    this.fitHeight,
    this.fittedBoxEnbl = false,
    this.decorationThickness,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          shadows: shadows,
          fontStyle: fontStyle,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: TextDecorationStyle.solid),
      overflow: TextOverflow.clip,
      textAlign: textAlign,
    );
  }
}
