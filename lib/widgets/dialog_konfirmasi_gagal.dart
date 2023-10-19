import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';
import 'package:test_flutter_tirtakencana/utils/font_weight.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/button.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/button_outlined.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

class DialogKonfirmasiGagal extends StatefulWidget {
  const DialogKonfirmasiGagal({super.key});

  @override
  State<DialogKonfirmasiGagal> createState() => _DialogKonfirmasiGagalState();
}

class _DialogKonfirmasiGagalState extends State<DialogKonfirmasiGagal> {
  List<String> reasonOptions = [
    'Pilih Alasan',
    'Toko Tutup',
    'Pemilik Toko Tidak Ada'
  ];

  String reasonValue = 'Pilih Alasan';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
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
              str: 'Gagal Terima TTH',
              color: ColorHelpers.black,
              fontSize: FontSizeHelper.header,
              fontWeight: FontWeightHelpers.bold,
            ),
            //content
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: const BorderSide(
                    color: ColorHelpers.primary,
                    width: 2.0,
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: reasonValue,
                  onChanged: (newValue) {
                    setState(() {
                      reasonValue = newValue!;
                    });
                  },
                  items: reasonOptions.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: option == 'Pilih Alasan'
                                  ? ColorHelpers.red
                                  : ColorHelpers.primary,
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: ColorHelpers.white,
                              size: 14,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            option,
                            style: const TextStyle(color: ColorHelpers.grey),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            //footer
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonOutlinedWidget(
                  onPressed: () {},
                  btnText: 'BATAL',
                  borderColor: ColorHelpers.primary,
                  textColor: ColorHelpers.black,
                  icon: Icons.close,
                ),
                ButtonWidget(
                  onPressed: () {},
                  btnText: 'SIMPAN',
                  btnColor: ColorHelpers.primary,
                  icon: Icons.check_circle_outline,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
