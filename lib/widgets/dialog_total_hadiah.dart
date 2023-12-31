import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_tirtakencana/models/customer.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';
import 'package:test_flutter_tirtakencana/utils/font_weight.dart';
import 'package:test_flutter_tirtakencana/widgets/list_gift_qty.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

class DialogTotalHadiah extends StatelessWidget {
  final List<String> giftTypes;
  final List<Customer> customers;

  const DialogTotalHadiah({
    Key? key,
    required this.giftTypes,
    required this.customers,
  }) : super(key: key);

  List<Map<String, dynamic>> getListOfGifts() {
    return giftTypes.map((giftType) {
      int qty = 0;

      for (var customer in customers) {
        for (var customerTTH in customer.customerTTHs) {
          if (customerTTH.customerTTHDetail.jenis == giftType) {
            qty += customerTTH.customerTTHDetail.qty;
          }
        }
      }

      return {
        'giftType': giftType,
        'qty': qty,
        'unit': giftType.contains('Emas') ? 'Buah' : 'Lembar',
      };
    }).toList();
  }

  int getTotalGift() {
    return getListOfGifts()
        .map((gift) => gift['qty'])
        .toList()
        .reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 36.0,
        ),
        decoration: BoxDecoration(
          color: ColorHelpers.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //header
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/gift2.png',
                  width: FontSizeHelper.header * 2,
                  height: FontSizeHelper.header * 2,
                ),
                const SizedBox(width: 8.0),
                const Expanded(
                  child: TextWidget(
                    str: 'Total Hadiah',
                    color: ColorHelpers.black,
                    fontSize: FontSizeHelper.header,
                    fontWeight: FontWeightHelpers.bold,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorHelpers.primary,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: ColorHelpers.white,
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.lime,
              thickness: 2.0,
            ),

            //content
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (Map<String, dynamic> gift in getListOfGifts())
                  ListGiftQtyWidget(
                    giftType: gift['giftType'],
                    qty: gift['qty'],
                    unit: gift['unit'],
                  )
              ],
            ),

            const Divider(
              color: Colors.lime,
              thickness: 2.0,
            ),

            //footer
            Row(
              mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(
                  str: getTotalGift().toString(),
                  color: ColorHelpers.primary,
                  fontWeight: FontWeightHelpers.bold,
                  fontSize: FontSizeHelper.title,
                ),
                const SizedBox(width: 16.0),
                const TextWidget(
                  str: 'Hadiah',
                  color: ColorHelpers.black,
                  fontSize: FontSizeHelper.title,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
