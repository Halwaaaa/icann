import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/compnated/Doctrion.dart';
import 'package:ican/core/utlies/image.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/textStyle.dart';

class SearchOfCoffe extends StatelessWidget {
  const SearchOfCoffe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width * 0.65,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: dafultDecoration(15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Image.asset(
              AppImageName.Search1,
              height: 25,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            flex: 2,
            child: FittedBox(
              child: Text(
                AppText.Find.tr,
                style: ApptextStyle.textStyleApp12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
