import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/enum/enumOrder.dart';
import 'package:ican/featuers/home/Presentation/models/OrderDatiles.dart';
import 'package:ican/featuers/home/Presentation/models/OrderSatutes.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';

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
List<OrderSatutes> moudlesOrderStautsDafult = [
  OrderSatutes(id: 1, name: "dss", orders: 1),
  OrderSatutes(id: 1, name: "dss", orders: 1),
  OrderSatutes(id: 1, name: "dss", orders: 1),
];
List<OrderModels> moudlesOrderDafult = [
  OrderModels(
      id: 1,
      order_number: 11,
      state: "sss",
      total_amount: 666,
      client_phone: "ssss"),
  OrderModels(
      id: 1,
      order_number: 11,
      state: "sss",
      total_amount: 666,
      client_phone: "ssss"),
  OrderModels(
      id: 1,
      order_number: 11,
      state: "sss",
      total_amount: 666,
      client_phone: "ssss"),
  OrderModels(
      id: 1,
      order_number: 11,
      state: "sss",
      total_amount: 666,
      client_phone: "ssss"),
];
List<String> orderListTitel(OrderModels o) {
  return [
    "${AppText.orderNumber.tr}: ${o.order_number}",
    "${AppText.City.tr}:  ${o.state}",
    "${AppText.totalAmount.tr}:  ${o.total_amount}",
    "${AppText.phoneOfClinet.tr}:  ${o.client_phone}",
  ];
}

List<String> orderListIconName = [
  AppImageName.order,
  AppImageName.cityOrder,
  AppImageName.totalAmount,
  AppImageName.phone
];

List<String> orderInformation(OrderDatiles o) {
  return [
    "${EnumorderIetm.orderNumber.label.tr}:  ${o.order_number}",
    "${EnumorderIetm.sendingBranch.label.tr}:  ${o.sender_branch}",
    "${EnumorderIetm.receivingBranch.label.tr}:  ${o.receiving_branch}",
    "${EnumorderIetm.nameClient.label.tr}:  ${o.customer_name}",
    "${EnumorderIetm.nameEmployee.label.tr}:  ${o.staff_name}",
    "${EnumorderIetm.phoneClient.label.tr}:  ${o.customer_phone} ",
    "${EnumorderIetm.phoneEmployee.label.tr}:  ${o.staff_phone}",
  ];
}

List<String> custmorInformation(OrderDatiles o) {
  return [
    "${AppText.customerName.tr}:  ${o.client_name} ",
    "${AppText.phoneCustomer.tr}:  ${o.client_phone}",
    "${AppText.whatsAppcustomer.tr}: ${o.client_phone_two}",
    "${AppText.numberOfPieces.tr}: ${o.number_of_pieces}",
    "${AppText.typesGoods.tr}:  ${o.products.map(
      (e) => e as String,
    )}"
  ];
}

List<String> areaInformation(OrderDatiles o) {
  return [
    "${AppText.City.tr}: ${o.city}",
    "${AppText.district.tr}:  ${o.address}",
    "${AppText.area.tr}:  ${o.state}",
  ];
}

List<String> payesInformation(OrderDatiles o) {
  return [
    "${AppText.amountInWriting.tr}: ${o.amount_writing}",
    "${AppText.totalAmount.tr}:  ${o.total_amount}",
    "${AppText.deliveryFee.tr}:  ${o.delivery_fee}",
    "${AppText.netAmount.tr}:  ${o.net_amount} ",
  ];
}

List<String> stautsInformation(OrderDatiles o) {
  return ["${AppText.satuts.tr}: ${o.status} "];
}

List<String> dateInformation(OrderDatiles o) {
  return [
    "${AppText.dateAdded.tr}:  ${o.created_at}",
    //  "${AppText.lastUpdate.tr}:  ${o.u}"
  ];
}

List<String> delegateInformationc(OrderDatiles o) {
  return ["${AppText.delegateName.tr}:  ", "${AppText.phoneDelegate.tr}:  210"];
}

List<String> archeiv = [
  AppText.deliveredArchive.tr,
  AppText.returnedArchive.tr,
];
