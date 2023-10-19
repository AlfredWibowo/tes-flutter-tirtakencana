import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';
import 'package:test_flutter_tirtakencana/utils/font_weight.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

class DialogTotalHadiah extends StatelessWidget {
  const DialogTotalHadiah({super.key});

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
                      Navigator.pop(context);
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
            ListTile(
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
              title: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    str: 'Emas 25 Gr',
                    color: ColorHelpers.black,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        str: '2',
                        color: ColorHelpers.primary,
                        fontWeight: FontWeightHelpers.bold,
                      ),
                      SizedBox(width: 16.0),
                      TextWidget(
                        str: 'Buah',
                        color: ColorHelpers.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(
              color: Colors.lime,
              thickness: 2.0,
            ),

            //footer
            const Row(
              mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(
                  str: '2',
                  color: ColorHelpers.primary,
                  fontWeight: FontWeightHelpers.bold,
                ),
                SizedBox(width: 16.0),
                TextWidget(
                  str: 'Hadiah',
                  color: ColorHelpers.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
