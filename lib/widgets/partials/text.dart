import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String str;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final IconData? icon;

  const TextWidget({
    Key? key,
    required this.str,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      color: color,
    );

    return icon == null
        ? Text(
            str,
            textAlign: textAlign,
            style: textStyle,
          )
        : Row(
            children: [
              Icon(
                icon,
                size: fontSize,
                color: color,
              ),
              const SizedBox(width: 8.0),
              Text(
                str,
                textAlign: textAlign,
                style: textStyle,
              ),
            ],
          );
  }
}
