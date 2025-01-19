import 'package:flutter/cupertino.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/setting/Presentation/Models/countModels.dart';

class RemoteAddOrder {
  final ServicesDio servicesDio;
  RemoteAddOrder(this.servicesDio);
  Future<void> addOrder(
      OrderAddModel orderAddModel, BuildContext context) async {
    print("llllllllllllllllllllllllllllllll");

    try {
      print(orderAddModel.toMap());
      Map<String, dynamic>? response = await servicesDio.postRequestWithFile(
          'orders/store',
          data: await orderAddModel.sendData());
      Dafultdialog().dialogsucces(context, response?['message']).show();

      print(response);
    } catch (erorr) {
      Dafultdialog().dailogErorr(context, [erorr.toString()]).show();
    }
  }
}
