import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/utlies/Modules.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/home/controol/controolHome.dart';

class itemCatery extends StatelessWidget {
  const itemCatery({super.key, required this.index, required this.controll});
  final int index;
  final ControolHome controll;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controll.ChangedSelctedCategay(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 3,
          ),
          Text(
            ModulesCategory[index],
            style: !controll.isSelctedCategay[index]
                ? ApptextStyle.textStyleAppCategoryUnSelcted
                : ApptextStyle.textStyleAppCategorySelcted,
          ),
          const SizedBox(
            height: 5,
          ),
          //Opacity(opacity: opacity),
          Visibility(
              visible: controll.isSelctedCategay[index],
              child: const CircleAvatar(
                radius: 5,
                backgroundColor: AppColor.dafultColor,
              )),
          const SizedBox(
            width: 3,
          ),
        ],
      ),
    );
  }
}
