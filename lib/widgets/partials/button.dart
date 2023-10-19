import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final IconData? icon;
  final double? height;
  final Color? btnColor;
  final Color? textColor;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.btnText,
    this.icon,
    this.height,
    this.btnColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle btnStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      backgroundColor: ColorHelpers.primary,
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
            icon: Icon(icon),
            label: TextWidget(
              str: btnText,
              color: textColor,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              padding: const EdgeInsets.all(16.0),
            ),
          );
  }
}
