import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/enum/enumOrder.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:iconly/iconly.dart';

List<String> modulesCategoryCustmor = [
  enumCategory.Accounting.label,
  enumCategory.OrderStatus.label,
  enumCategory.ArchiveStorage.label,
  enumCategory.Review.label,
  enumCategory.Account.label
];
List<String> modulesCategoryGroup = [
  enumCategory.CustomerManagement.label,
  enumCategory.Accounting.label,
  enumCategory.OrderStatus.label,
  enumCategory.ArchiveStorage.label,
  enumCategory.Review.label,
  enumCategory.Account.label
];
List<String> modulesIconGroup = [
  enumCategory.CustomerManagement.Icon,
  enumCategory.Accounting.Icon,
  enumCategory.OrderStatus.Icon,
  enumCategory.ArchiveStorage.Icon,
  enumCategory.Review.Icon,
  enumCategory.Account.Icon,
];
List<String> modulesIconCustmor = [
  enumCategory.Accounting.Icon,
  enumCategory.OrderStatus.Icon,
  enumCategory.ArchiveStorage.Icon,
  enumCategory.Review.Icon,
  enumCategory.Account.Icon,
];

List<String> modulesCategoryAppbar = [
  enumCategory.Mian.label,
  enumCategory.CustomerManagement.label,
  enumCategory.Gruop.label,
  enumCategory.Accounting.label,
  enumCategory.OrderStatus.label,
  enumCategory.ArchiveStorage.label,
  enumCategory.Review.label,
  enumCategory.Account.label,
];

List<String> modulesCategoryMain = [
  enumCategory.CustomerManagement.label,
  enumCategory.Gruop.label,
  enumCategory.Accounting.label,
  enumCategory.OrderStatus.label,
  enumCategory.ArchiveStorage.label,
  enumCategory.Review.label,
  enumCategory.Account.label,
];
List<String> modulesIconMain = [
  enumCategory.CustomerManagement.Icon,
  enumCategory.Gruop.Icon,
  enumCategory.Accounting.Icon,
  enumCategory.OrderStatus.Icon,
  enumCategory.ArchiveStorage.Icon,
  enumCategory.Review.Icon,
  enumCategory.Account.Icon,
];
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
List<String> moudelsTitelCustmor = [
  "${AppText.name.tr}: رانية ",
  "${AppText.mobileNumber.tr}: 0258",
  "${AppText.dateAdded.tr}:  20/2/2024  10pm"
];
List<String> moudelsTitelGroup = [
  "${AppText.groupName.tr}: المصطفى",
  "${AppText.groupLeader.tr}: مصطفى",
  "${AppText.dateAdded.tr}: 2014/2/1    10 pm ",
  "${AppText.dateEdit.tr}: 2014/2/1   10 pm",
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
