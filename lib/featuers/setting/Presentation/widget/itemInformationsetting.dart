import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';

class ItemInformationSetting extends StatelessWidget {
  const ItemInformationSetting(
      {super.key,
      required this.titel,
      required this.iconNameStart,
      this.onTap});
  final String titel;
  final String iconNameStart;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 0,
        children: [
          const SizedBox(
            height: 10,
          ),
          Ietm(
              Item: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      iconNameStart,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  Text(
                    titel,
                    style: ApptextStyle.textStyleApp24Selcted
                        .copyWith(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Transform.rotate(
                      angle: 3.14,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 25,
                      ),
                    ),
                  ),
                  // const Text("1466", style: ApptextStyle.textStyleApp16)
                ],
              ),
              heightOfShadowLeft: 90,
              wdith: Mathed.ResponcvMax(
                  MediaQuery.sizeOf(context).width * 0.9, 350)),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
