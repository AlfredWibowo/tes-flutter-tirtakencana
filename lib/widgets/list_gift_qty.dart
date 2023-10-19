import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_weight.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

class ListGiftQtyWidget extends StatelessWidget {
  final String giftType;
  final int qty;
  final String unit;

  const ListGiftQtyWidget({
    Key? key,
    required this.giftType,
    required this.qty,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: ColorHelpers.appBarBtn,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(
          Icons.card_giftcard,
          color: ColorHelpers.white,
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            str: giftType,
            color: ColorHelpers.black,
          ),
          Row(
            children: [
              TextWidget(
                str: qty.toString(),
                color: ColorHelpers.primary,
                fontWeight: FontWeightHelpers.bold,
              ),
              const SizedBox(width: 16.0),
              TextWidget(
                str: unit,
                color: ColorHelpers.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
