import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';

class CardGiftWidget extends StatelessWidget {
  final String giftId;

  const CardGiftWidget({
    Key? key,
    required this.giftId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorHelpers.secondary,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ListTile(
        minLeadingWidth: 0,
        leading: const Image(
          image: AssetImage('assets/images/gift.png'),
          width: 20.0,
          height: 20.0,
        ),
        title: Text(
          giftId,
          style: const TextStyle(
            color: ColorHelpers.white,
            fontSize: FontSizeHelper.normal,
          ),
        ),
      ),
    );
  }
}
