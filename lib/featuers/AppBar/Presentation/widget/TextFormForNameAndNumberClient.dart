import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';

class TextFormForNameAndNumberClient extends StatelessWidget {
  const TextFormForNameAndNumberClient({
    super.key,
    required this.searchControll,
  });

  final SearchControll searchControll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DadfultBoutton(
          isTextFormFiled: true,
          onTap: () {
            print("object");
          },
          keyboardType: TextInputType.name,
          controllerText: searchControll.nameClientController,
          title: AppText.nameOfClinet.tr,
          focusNode: searchControll.focusNodeNameClient,
          ColorSelected: AppColor.primaryAppbar,
          icon: Image.asset(
            AppImageName.profile,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DadfultBoutton(
            isTextFormFiled: true,
            controllerText: searchControll.phoneClientController,
            focusNode: searchControll.focusNodeNumberClient,
            keyboardType: TextInputType.phone,
            title: AppText.phoneOfClinet.tr,
            ColorSelected: AppColor.primaryAppbar,
            icon: const Icon(Icons.phone_in_talk)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
