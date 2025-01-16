import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/textStyle.dart';

class DafultInformationOneClomun extends StatelessWidget {
  const DafultInformationOneClomun({
    super.key,
    required this.titel,
    required this.iconName,
    required this.isSlected,
    this.onTap,
  });
  final String titel;
  final String iconName;
  final bool isSlected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Ietm(
            isSelected: isSlected,
            Item: item(iconName: iconName, titel: titel),
            heightOfShadowLeft: 100,
            wdith: MediaQuery.sizeOf(context).width * 0.3),
      ),
    );
  }
}

class item extends StatelessWidget {
  const item({
    super.key,
    required this.iconName,
    required this.titel,
  });

  final String iconName;
  final String titel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: FittedBox(
              child: Image.asset(
                iconName,
                height: 30,
                width: 30,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: FittedBox(
              child: Text(
                titel,
                textAlign: TextAlign.center,
                style: ApptextStyle.textStyleApp16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
