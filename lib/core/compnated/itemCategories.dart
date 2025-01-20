import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/compnated/Doctrion.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';

class ItemCategories extends StatelessWidget {
  const ItemCategories(
      {super.key,
      required this.index,
      required this.titel,
      required this.isText,
      required this.icon});
  final int index;
  final List<String> titel;
  final List<String> icon;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  !isText
                      ? Image.asset(
                          icon[index],
                          // IconlyBold.user_2,
                          height: 30.0,
                        )
                      : Text(
                          icon[index],
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: ApptextStyle.textStyleApp16,
                        ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      titel[index],
                      // softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: ApptextStyle.textStyleApp16.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: FittedBox(child: Icon(Icons.arrow_back_ios))),
                //  Spacer(),
                Flexible(child: FittedBox(child: Icon(Icons.search)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
