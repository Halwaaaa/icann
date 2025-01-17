import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/utlies/route.dart';
import 'package:ican/featuers/login/Data/RemoteLogin.dart';
import 'package:ican/featuers/login/Data/localLogin.dart';

class LoginControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  static String loginView = 'login';
  static String loginLoding = 'loginLoding';
  late TextEditingController textNameUser;
  late TextEditingController textPassWord;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Offset> positoin;
  late Animation<double> opctiy;
  late FocusNode focusNodeNameUser;
  late FocusNode focusNodePassWord;

  late bool loginStart;

  @override
  void onInit() {
    textNameUser = TextEditingController();
    textPassWord = TextEditingController();
    focusNodeNameUser = FocusNode();
    focusNodePassWord = FocusNode();
    loginStart = false;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation =
        CurvedAnimation(curve: Curves.linear, parent: animationController);
    positoin = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(animation);
    opctiy = Tween<double>(begin: 0.0, end: 1).animate(animation);

    super.onInit();
  }

  @override
  void onClose() {
    textNameUser.dispose();
    textPassWord.dispose();
    focusNodeNameUser.dispose();
    focusNodePassWord.dispose();
    animationController.dispose();
    super.onClose();
  }

  Future<void> login(BuildContext context) async {
    focusNodeNameUser.unfocus();
    focusNodePassWord.unfocus();
    loginStart = true;
    RemoteLogin remoteLogin = RemoteLogin();
    LocalLogin localLogin = LocalLogin();
    update([loginLoding]);
    try {
      final response = await remoteLogin.loginWithUser(
        'login',
        data: {
          "username": textNameUser.text.toString(),
          "password": textPassWord.text.toString()
        },
        headers: {
          'Applanguage': 'en',
        },
      );
      print(response);
      localLogin.storeUserData(response);

      loginStart = false;

      update([loginLoding]);
    } catch (error) {
      loginStart = false;
      update([loginLoding]);

      print('Login Failed: ${error.toString()}');
      Dafultdialog().dailogErorrLog(
          context, [error.toString().replaceFirst('Exception: ', '')]).show();
    }
  }
}
