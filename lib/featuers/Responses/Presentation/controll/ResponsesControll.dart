import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/Modules/MoudulesResponses.dart';
import 'package:ican/featuers/Responses/Data/Locale/LocalResonses.dart';
import 'package:ican/featuers/Responses/Data/Remote/RemoteResponses.dart';
import 'package:ican/featuers/Responses/Presentation/Modles/ResponsesModels.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';

class ResponsesControll extends GetxController {
  static String responsesAll = 'responsesAll';
  late List<GlobalKey> columnKeys;
  late List<double> heightsOfShadowLeft;
  late List<ResponsesModels>? responsesDataAll;
  late Mainlayoutcontroll mainlayoutcontroll;
  late bool noresponses;
  Timer? t;

  late bool lodingResponses;
  @override
  void onInit() {
    lodingResponses = true;
    noresponses = false;
    responsesDataAll = null;
    mainlayoutcontroll = Get.find();
    if (mainlayoutcontroll.indexSelected == 0) {
      Ordercontroll ordercontroll = Get.find();
      getLocalResonsesByid(ordercontroll.idOrder);
    } else {
      getLocalResonsesAll();
    }

    super.onInit();
  }

  double getTextHeight(String text, TextStyle style, double maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      // maxLines: null, // السماح بعدة أسطر
      textDirection: TextDirection.rtl,
    )..layout(maxWidth: maxWidth);
    print(textPainter.size.height);
    return textPainter.size.height; // ارتفاع النص
  }

  Future<void> getLocalResonsesAll() async {
    bool isNullLocal = false;
    Box<List<dynamic>> boxRes =
        await Hive.openBox<List<dynamic>>(HivenServices.responsesAll);
    LocalResonses localResonses = LocalResonses(boxRes);
    List<ResponsesModels>? local = await localResonses.getResponsesAll();
    if (local != null) {
      lodingResponses = false;
      responsesDataAll = local;
      update([responsesAll]);
    } else {
      isNullLocal = true;
      lodingResponses = true;
      responsesDataAll = null;
      update([responsesAll]);
    }
    getRemteRsponses(isNullLocal, localResonses);
  }

  Future<void> getRemteRsponses(
    bool isNullLoacl,
    LocalResonses localResonses,
  ) async {
    final ServicesDio servicesDio = Get.find();
    RemoteResponses remoteResponses = RemoteResponses(servicesDio);

    List<ResponsesModels>? result = await remoteResponses.getResponsesAll();
    if (result != null) {
      print("object");

      //  print(result.first.client_phone);
      lodingResponses = false;
      responsesDataAll = result;
      localResonses.setResponsesAll(
        result,
      );
      update([responsesAll]);
    } else {
      if (isNullLoacl) {
        Get.snackbar(
          "خطا",
          "الرجاء التحقق من الاتصال",
          //backgroundColor: Colors.black,
          colorText: Colors.black,
          duration: const Duration(seconds: 5),
        );
        t = Timer.periodic(const Duration(seconds: 10), (time) async {
          List<ResponsesModels>? result =
              await remoteResponses.getResponsesAll();
          print(time.tick);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            lodingResponses = false;
            responsesDataAll = result;
            update([responsesAll]);
            time.cancel();
          }
        });
      }
    }
  }

  Future<void> getLocalResonsesByid(int id) async {
    bool isNullLocal = false;
    Box<List<dynamic>> boxRes =
        await Hive.openBox<List<dynamic>>(HivenServices.responsesAll);
    LocalResonses localResonses = LocalResonses(boxRes);
    List<ResponsesModels>? local = await localResonses.getResponsesWithId(id);
    if (local != null) {
      print("object");
      lodingResponses = false;
      responsesDataAll = local;
      update([responsesAll]);
    } else {
      isNullLocal = true;
      lodingResponses = true;
      responsesDataAll = null;
      update([responsesAll]);
    }
    getRemteRsponsesWithId(isNullLocal, localResonses, id);
  }

  Future<void> getRemteRsponsesWithId(
      bool isNullLoacl, LocalResonses localResonses, int id) async {
    final ServicesDio servicesDio = Get.find();
    RemoteResponses remoteResponses = RemoteResponses(servicesDio);

    List<ResponsesModels>? result = await remoteResponses.getResponsesById(id);
    if (result != null) {
      //  print(result.first.client_phone);
      lodingResponses = false;
      responsesDataAll = result;
      localResonses.setResponsesWithOrderId(result, id);
      update([responsesAll]);
    } else {
      if (isNullLoacl) {
        Get.snackbar(
          "خطا",
          "الرجاء التحقق من الاتصال",
          //backgroundColor: Colors.black,
          colorText: Colors.black,
          duration: const Duration(seconds: 5),
        );
        t = Timer.periodic(const Duration(seconds: 10), (time) async {
          List<ResponsesModels>? result =
              await remoteResponses.getResponsesAll();
          print(time.tick);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            lodingResponses = false;
            responsesDataAll = result;
            update([responsesAll]);
            time.cancel();
          }
        });
      }
    }
  }
}
