import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontFamily,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
