import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/enum/enumOrder.dart';
import 'package:ican/core/utlies/enum/enumPermation.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:iconly/iconly.dart';

List<String> modulesCategoryCustmor = [
  enumCategory.Accounting.label,
  enumCategory.OrderStatus.label,
  enumCategory.ArchiveStorage.label,
  enumCategory.Review.label,
  enumCategory.Account.label
];
List<String> modulesCategoryGroup = [
//  enumCategory.CustomerManagement.label,
  //enumCategory.Accounting.label,
  enumCategory.OrderStatus.label,
  // enumCategory.ArchiveStorage.label,
  // enumCategory.Review.label,
  // enumCategory.Account.label
];
List<String> modulesIconGroup = [
  //enumCategory.CustomerManagement.Icon,
  //enumCategory.Accounting.Icon,
  enumCategory.OrderStatus.Icon,
  //enumCategory.ArchiveStorage.Icon,
  //enumCategory.Review.Icon,
  //enumCategory.Account.Icon,
];
List<String> modulesIconCustmor = [
  enumCategory.Accounting.Icon,
  enumCategory.OrderStatus.Icon,
  enumCategory.ArchiveStorage.Icon,
  enumCategory.Review.Icon,
  enumCategory.Account.Icon,
];

List<String> modulesCategoryAppbar() {
  HivenServices hivenServices = Get.find();
  User? user = hivenServices.userbox.get(HivenServices.user);
  List<String> result = [enumCategory.Mian.label];
  if (user!.permation.contains(enumPermation.customers.label)) {
    result.add(enumCategory.CustomerManagement.label);
  }
  if (user.permation.contains(enumPermation.staffs.label)) {
    result.add("الموظفين");
  }
  if (user.permation.contains(enumPermation.groups.label)) {
    result.add(enumCategory.Gruop.label);
  }
  if (user.permation.contains(enumPermation.orders.label)) {
    result.add(enumCategory.OrderStatus.label);
  }
  result.add(
    enumCategory.Account.label,
  );
  return result;
}

List<String> modulesCategoryMain() {
  List<String> item = [];
  HivenServices hivenServices = Get.find();
  User? user = hivenServices.userbox.get(HivenServices.user);
  print(user!.permation.contains(enumPermation.customers.label));
  if (user.permation.contains(enumPermation.customers.label)) {
    item.add(enumCategory.CustomerManagement.label);
  }
  if (user.permation.contains(enumPermation.staffs.label)) {
    item.add("الموظفين");
  }
  if (user.permation.contains(enumPermation.groups.label)) {
    item.add(enumCategory.Gruop.label);
  }
  if (user.permation.contains(enumPermation.orders.label)) {
    item.add(enumCategory.OrderStatus.label);
  }
  item.add(
    enumCategory.Account.label,
  );
  return item;
}

List<String> modulesIconMain() {
  List<String> item = [];
  HivenServices hivenServices = Get.find();
  User? user = hivenServices.userbox.get(HivenServices.user);
  if (user!.permation.contains(enumPermation.customers.label)) {
    item.add(enumCategory.CustomerManagement.Icon);
  }
  if (user.permation.contains(enumPermation.staffs.label)) {
    item.add(enumCategory.CustomerManagement.Icon);
  }
  if (user.permation.contains(enumPermation.groups.label)) {
    item.add(enumCategory.Gruop.Icon);
  }
  if (user.permation.contains(enumPermation.orders.label)) {
    item.add(enumCategory.OrderStatus.Icon);
  }
  item.add(
    enumCategory.Account.Icon,
  );
  // enumCategory.Accounting.Icon,
  // enumCategory.ArchiveStorage.Icon,
  // enumCategory.Review.Icon,
  return item;
}

List<String> moudelsAcounting = [
  AppText.delegateAccountable.tr,
  AppText.branchReceiverBilled.tr,
  AppText.branchSenderBilled.tr,
  AppText.clientBilled.tr,
];
List<String> moudelsAcount = [
  AppText.balance.tr,
  AppText.deliveredDues.tr,
  AppText.store.tr,
  AppText.netAmount.tr,
  AppText.warehousePoints.tr,
  AppText.financialAccounts.tr,
  AppText.warehouseAccounts.tr,
];
List<String> moudelsAcount2 = [
  AppText.balance.tr,
  AppText.deliveredDues.tr,
  AppText.products.tr,
  AppText.netAmount.tr,
  AppText.products.tr,
  AppText.financialAccounts.tr,
  AppText.warehouseAccounts.tr,
];
List<String> modulesProduct = [
  "${AppText.productName.tr}:  الصياد ",
  "${AppText.quantity.tr}: 3",
  "${AppText.price.tr}:  26",
  "${AppText.totalPrice.tr}:  50",
  "${AppText.totalPoints.tr}:  0.255"
];
List<String> modulesProductNameIcon = [
  AppImageName.order,
  AppImageName.orderNumber,
  AppImageName.totalAmount,
  AppImageName.totalPrice,
  AppImageName.totalPoints,
];
List<String> moudlesStore = [
  AppText.products.tr,
  AppText.additionLists.tr,
  AppText.withdrawalLists.tr,
];
List<String> moudelsTitelCustmor(CustmorAlluser u) {
  return [
    "${AppText.name.tr}:  ${u.name}",
    "${AppText.mobileNumber.tr}:  ${u.mobile_no}",
    "${AppText.dateAdded.tr}:   ${u.created_at.padLeft(10)}"
  ];
}

List<String> moudelsTitelGroup(GroupUser group) {
  return [
    "${AppText.groupName.tr}:  ${group.name}",
    "${AppText.groupLeader.tr}: ${group.leader_name}",
    "${AppText.dateAdded.tr}:  ${group.created_at}",
    "${AppText.dateEdit.tr}:  ${group.updated_at}",
  ];
}

List<GroupUser> groupDataDafult = [
  GroupUser(
      id: 0,
      name: "ffffff",
      created_at: "dddd",
      updated_at: "dada",
      leader_name: "wwfwff"),
  GroupUser(
      id: 0,
      name: "ffffff",
      created_at: "dddd",
      updated_at: "dada",
      leader_name: "wwfwff"),
  GroupUser(
      id: 0,
      name: "ffffff",
      created_at: "dddd",
      updated_at: "dada",
      leader_name: "wwfwff"),
];

List<String> modulesIconNameCustmor = [
  AppImageName.profile,
  AppImageName.phone,
  AppImageName.date,
];
List<String?> modulesIconNameGroup = [
  AppImageName.profile,
  AppImageName.profile2,
  AppImageName.date,
  null,
];
List<String> modulesIconNameGroup2 = [
  AppImageName.profile,
  AppImageName.profile2,
  AppImageName.date,
  AppImageName.date,
];
List<String> modulesTitleAcount = [
  "${AppText.bondNumber.tr}:  251455",
  "${AppText.userName.tr}:   ليث",
  "${AppText.bondType.tr}:  60000",
  "${AppText.amount.tr}:  45125",
  "${AppText.amount.tr}:  45125",
  "${AppText.dateAdded.tr}:  45125",
];
List<String> modulesIconNameAcount = [
  AppImageName.order,
  AppImageName.profile,
  AppImageName.profile2,
  AppImageName.totalAmount,
  AppImageName.notes,
  AppImageName.date
];
List<String> moduleTitelStroe = [
  "${AppText.listNumber.tr}:  45125",
  "${AppText.clientName.tr}:  ليث",
  "${AppText.notes.tr}:  ا تحويل من حساب نتاليا",
  "${AppText.dateAdded.tr}:  20/2022/2  20.00pm",
  "${AppText.createdBy.tr}:  ليث",
];
List<String> moduleIconNameStroe = [
  AppImageName.orderNumber,
  AppImageName.profile,
  AppImageName.order,
  AppImageName.date,
  AppImageName.creatby,
];
List<String> moduleTitelAccountInformation = [
  AppText.clientName.tr,
  AppText.credit.tr,
  AppText.debit.tr,
];
List<String> moduleIconNameAcountInformation = [
  AppImageName.profile,
  AppImageName.order,
  AppImageName.order,
];
