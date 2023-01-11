import 'package:flutter/material.dart';

import '../config/appColors.dart';
import '../config/appConfigs.dart';

class KText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final int? maxline;
  final TextAlign? textAlign;
  final double? wordSpacing;

  KText({
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.maxline,
    required this.text,
    this.textAlign,
    this.wordSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      maxLines: maxline,
      style: TextStyle(
          fontSize: fontSize != null ? fontSize : 14,
          fontFamily: fontFamily != null ? fontFamily : regular,
          fontWeight: fontWeight,
          wordSpacing: wordSpacing != null ? wordSpacing : 1.7,
          //wordSpacing: wordSpacing,
          color: color != null ? color : black),
    );
  }
}
