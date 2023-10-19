import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/models/customer_tth.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';

class CardGiftWidget extends StatelessWidget {
  final CustomerTTH customerTTH;

  const CardGiftWidget({
    Key? key,
    required this.customerTTH,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
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
          customerTTH.ttoTTPNo,
          style: const TextStyle(
            color: ColorHelpers.white,
            fontSize: FontSizeHelper.normal,
          ),
        ),
      ),
    );
  }
}
