import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

class ButtonOutlinedWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final IconData? icon;
  final double? height;
  final Color borderColor;
  final Color? textColor;

  const ButtonOutlinedWidget({
    Key? key,
    required this.onPressed,
    required this.btnText,
    this.icon,
    this.height,
    required this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle btnStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: borderColor,
          width: 2.0,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );

    return icon == null
        ? ElevatedButton(
            onPressed: onPressed,
            style: btnStyle,
            child: TextWidget(
              str: btnText,
              color: textColor,
            ),
          )
        : ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: borderColor,
            ),
            label: TextWidget(
              str: btnText,
              color: textColor,
            ),
            style: btnStyle,
          );
  }
}
