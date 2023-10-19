import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';
import 'package:test_flutter_tirtakencana/widgets/card_gift.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

class CardTokoWidget extends StatelessWidget {
  // final List<String> listOfToko;
  // final List<String> listOfGift;

  const CardTokoWidget({
    Key? key,
    // required this.listOfToko,
    // required this.listOfGift,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          color: ColorHelpers.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            // str: listOfToko[index],
                            str: 'name',
                            color: ColorHelpers.white,
                            fontSize: FontSizeHelper.title,
                          ),
                          SizedBox(height: 4.0),
                          TextWidget(
                            str: 'address',
                            color: ColorHelpers.white,
                            fontSize: FontSizeHelper.subtitle,
                            icon: Icons.location_on_outlined,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextWidget(
                          // str: listOfToko[index],
                          str: 'status',
                          color: ColorHelpers.white,
                          fontSize: FontSizeHelper.title,
                        ),
                        SizedBox(height: 4.0),
                        TextWidget(
                          str: 'phone number',
                          color: ColorHelpers.white,
                          fontSize: FontSizeHelper.subtitle,
                          icon: Icons.phone,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //list
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: ColorHelpers.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  children: [
                    CardGiftWidget(giftId: 'TTOL-00A-2306-90081'),
                    const SizedBox(height: 36.0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 2,
      separatorBuilder: (context, index) {
        return Container();
      },
    );
  }
}
