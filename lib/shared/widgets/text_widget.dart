import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:danoetz_vascomm/shared/styles/styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  final EdgeInsetsGeometry padding;

  const CustomText({
    Key key,
    @required this.text,
    this.color = MyColors.primary,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
