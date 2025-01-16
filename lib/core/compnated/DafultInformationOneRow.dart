import 'package:flutter/cupertino.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';

class DafultInformationOneRow extends StatelessWidget {
  const DafultInformationOneRow({
    super.key,
    required this.titel,
  });
  final String titel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      children: [
        const SizedBox(
          height: 10,
        ),
        Ietm(
            Item: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    AppImageName.totalAmount,
                    height: 25,
                    width: 25,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      titel,
                      style: ApptextStyle.textStyleApp16,
                    ),
                    const Text("1466", style: ApptextStyle.textStyleApp16),
                  ],
                )
              ],
            ),
            heightOfShadowLeft: 90,
            wdith: Mathed.ResponcvMax(
                MediaQuery.sizeOf(context).width * 0.8, 300)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
