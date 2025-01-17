import 'package:flutter/cupertino.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';

class ItemAbout extends StatelessWidget {
  const ItemAbout({
    super.key,
    required this.iconName,
    required this.titel,
    this.isEn = false,
  });
  final String titel;
  final String iconName;
  final bool isEn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 0,
      children: [
        const SizedBox(
          height: 10,
        ),
        Ietm(
            Item: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                // const Spacer(),
                Flexible(
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.none,
                    child: Text(
                      titel,
                      textDirection: TextDirection.ltr,
                      style: ApptextStyle.textStyleApp24Selcted
                          .copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    iconName,
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            heightOfShadowLeft: 100,
            wdith: Mathed.ResponcvMax(
                MediaQuery.sizeOf(context).width * 0.8, 300)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
