import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';
import 'package:test_flutter_tirtakencana/utils/font_weight.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/button.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/button_outlined.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

class DialogKonfirmasi extends StatelessWidget {
  const DialogKonfirmasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: ColorHelpers.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //header
            const TextWidget(
              str: 'Sudah Terima TTH',
              color: ColorHelpers.black,
              fontSize: FontSizeHelper.header,
              fontWeight: FontWeightHelpers.bold,
            ),
            //content
            Image.asset(
              'assets/images/faq.jpg',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const TextWidget(
              str: 'Yakin ingin menyimpan sudah terima TTH?',
              color: ColorHelpers.black,
              fontSize: FontSizeHelper.normal,
              fontWeight: FontWeightHelpers.regular,
            ),
            //footer
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonOutlinedWidget(
                  onPressed: () {},
                  btnText: 'TIDAK',
                  borderColor: ColorHelpers.primary,
                  textColor: ColorHelpers.black,
                ),
                ButtonWidget(
                  onPressed: () {},
                  btnText: 'YA SUDAH TERIMA',
                  btnColor: ColorHelpers.primary,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}