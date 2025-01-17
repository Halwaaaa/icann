import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';

class ItemDrawrer extends StatelessWidget {
  const ItemDrawrer({
    super.key,
    required this.titel,
    this.nameIcon,
    this.onTap,
  });
  final String titel;
  final String? nameIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: nameIcon == null
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      nameIcon!,
                      height: 25,
                      width: 25,
                    ),
                  ),
            titleAlignment: ListTileTitleAlignment.center,
            title: Row(
                mainAxisAlignment: nameIcon == null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        maxLines: 1,
                        titel,
                        style: ApptextStyle.textStyleApp24Selcted
                            .copyWith(fontSize: 22),
                      ),
                    ),
                  ),
                ]),
          ),
          const Divider(
            thickness: 3,
            endIndent: 20,
            indent: 20,
            color: AppColor.primaryAppbar,
          ),
        ],
      ),
    );
  }
}
