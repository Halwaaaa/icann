import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/enum/enumOrder.dart';

List<String> moudlesLabelOrderStauts = [
  Enumorder.notSure.label.tr,
  Enumorder.withTheBrancSent.label.tr,
  Enumorder.withCenter.label.tr,
  Enumorder.withTheBranchReceived.label.tr,
  Enumorder.handling.label.tr,
  Enumorder.sure.label.tr,
  Enumorder.refusal.label.tr,
  Enumorder.resend.label.tr,
];
List<String> orderListTitel = [
  "${AppText.orderNumber.tr}: 00",
  "${AppText.City.tr}: جدة",
  "${AppText.totalAmount.tr}: 60000",
  "${AppText.phoneOfClinet.tr}: 45125",
];
List<String> orderListIconName = [
  AppImageName.order,
  AppImageName.cityOrder,
  AppImageName.totalAmount,
  AppImageName.phone
];

List<String> orderInformation = [
  "${EnumorderIetm.orderNumber.label.tr}:  5050",
  "${EnumorderIetm.sendingBranch.label.tr}:  مخزن",
  "${EnumorderIetm.receivingBranch.label.tr}:   بابل",
  "${EnumorderIetm.nameClient.label.tr}:  احمد",
  "${EnumorderIetm.nameEmployee.label.tr}:  ندى",
  "${EnumorderIetm.phoneClient.label.tr}:  50505544",
  "${EnumorderIetm.phoneEmployee.label.tr}:  5050045",
];
List<String> custmorInformation = [
  "${AppText.customerName.tr}:  ليث",
  "${AppText.phoneCustomer.tr}:  045445",
  "${AppText.whatsAppcustomer.tr}: .32555 ",
  "${AppText.phoneCustomer.tr}2: .32555 ",
  "${AppText.numberOfPieces.tr}: 20",
  "${AppText.typesGoods.tr}: جديدة"
];
List<String> areaInformation = [
  "${AppText.City.tr}: الرياض",
  "${AppText.district.tr}:  الرياض",
  "${AppText.area.tr}:  الرياض",
];
List<String> payesInformation = [
  "${AppText.amountInWriting.tr}: مليون",
  "${AppText.totalAmount.tr}:  4000",
  "${AppText.deliveryFee.tr}:  5000",
  "${AppText.netAmount.tr}:  5000",
];
List<String> stautsInformation = ["${AppText.satuts.tr}: مدفوع"];
List<String> dateInformation = [
  "${AppText.dateAdded.tr}:  20/2/2024   20pm",
  "${AppText.lastUpdate.tr}:  20/2/2024   20pm"
];
List<String> delegateInformationc = [
  "${AppText.delegateName.tr}:  2000045",
  "${AppText.phoneDelegate.tr}:  210"
];
List<String> archeiv = [
  AppText.deliveredArchive.tr,
  AppText.returnedArchive.tr,
];
