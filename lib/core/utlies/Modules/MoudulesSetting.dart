import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/enum/enumPermation.dart';
import 'package:ican/featuers/home/Presentation/models/StatmentModels.dart';
import 'package:ican/featuers/setting/Presentation/Models/LeaderModels.dart';

List<String> modulesSettingtitel() {
  List<String> result = [];
  HivenServices hivenServices = Get.find();
  User? user = hivenServices.userbox.get(HivenServices.user);
  if (user!.permation.contains(enumPermation.addGroup.label) ||
      user.permation.contains(enumPermation.editGroup.label)) {
    result.add(
      AppText.group.tr,
    );
  }
  if (user.permation.contains(enumPermation.addLeaders.label) ||
      user.permation.contains(enumPermation.editLeaders.label)) {
    result.add(
      AppText.groupLeader.tr,
    );
  }
  if (user.permation.contains(enumPermation.addStaff.label) ||
      user.permation.contains(enumPermation.editStaff.label)) {
    result.add(
      'الموظفين',
    );
  }

  result.add(AppText.reports.tr);
  if (user.permation.contains(enumPermation.addOrder.label)) {
    result.add('اضافة طلب');
  }

  return result;
}

List<String> modulesSetting() {
  List<String> result = [];
  result.add(
    AppText.settings.tr,
  );
  result.addAll(modulesSettingtitel());
  return result;
}

List<String> modulesSettingIconName() {
  List<String> result = [];
  HivenServices hivenServices = Get.find();
  User? user = hivenServices.userbox.get(HivenServices.user);
  if (user!.permation.contains(enumPermation.addGroup.label) ||
      user.permation.contains(enumPermation.editGroup.label)) {
    result.add(
      AppImageName.group,
    );
  }
  if (user.permation.contains(enumPermation.addLeaders.label) ||
      user.permation.contains(enumPermation.editLeaders.label)) {
    result.add(
      AppImageName.groupLeaders,
    );
  }
  if (user.permation.contains(enumPermation.addStaff.label) ||
      user.permation.contains(enumPermation.editStaff.label)) {
    result.add(AppImageName.Customer);
  }

  result.add(AppImageName.order);
  if (user.permation.contains(enumPermation.addOrder.label)) {
    result.add(AppImageName.OrderStatus);
  }

  return result;

//
}
//[
//   ,
//   AppImageName.custmor,
//   AppImageName.order,
//   AppImageName.OrderStatus
// ];

List<String> moudelsTitelAddGroup = [
  "${AppText.groupName.tr}: المصطفى",
  "${AppText.groupLeader.tr}: مصطفى",
  "${AppText.dateAdded.tr}: 2014/2/1    10 pm ",
  "${AppText.dateEdit.tr}: 2014/2/1   10 pm",
];
List<String> modulesIconNameAddGroup = [
  AppImageName.profile,
  AppImageName.profile2,
  AppImageName.date,
  AppImageName.date,
];
List<String> modulesTitelLeaderGroup(LeaderModels leader) {
  return [
    "${AppText.name.tr}:  ${leader.name}",
    "${AppText.phone.tr}:  ${leader.mobileNo}",
    "${AppText.dateAdded.tr}:   ${leader.createdAt}",
    "${AppText.groupName.tr}: ${leader.groupName}"
  ];
}

List<String> modulesIconNameLeaderGroup = [
  AppImageName.profile,
  AppImageName.phone,
  AppImageName.date,
  AppImageName.profile3,
];
List<Widget> ModulesiconTextFormForAddLeader = [
  const Icon(Icons.person),
  const Icon(Icons.person),
  Image.asset(
    AppImageName.password,
    height: 20,
  ),
  Image.asset(
    AppImageName.phone,
    height: 20,
  ),
  Image.asset(
    AppImageName.address,
    height: 20,
  ),
  Image.asset(
    AppImageName.stauts1,
    height: 20,
  ),
  Image.asset(
    AppImageName.notes1,
    height: 20,
  ),
];
List<String> modulesTitelTextFormForLeader = [
  AppText.fullName.tr,
  AppText.userName.tr,
  AppText.password.tr,
  AppText.phone.tr,
  AppText.address.tr,
  AppText.satuts.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
  AppText.notes.tr,
];
List<String> modulesTitelReport(StatementModels s) {
  return [
    "${AppText.reportNumber.tr}:  ${s.statementNo}",
    "${AppText.userName.tr}:   ${s.userName}",
    "${AppText.reportDate.tr}:  ${s.createdAt}",
    "${AppText.deliveryFee.tr}: ${s.deliveryFee}",
    "${AppText.netAmount.tr}:   ${s.netAmount}",
    "${AppText.receiptsCount.tr}:  ${s.ordersCount}",
  ];
}

List<String> modulesIconNameRepot = [
  AppImageName.orderNumber,
  AppImageName.profile,
  AppImageName.date,
  AppImageName.totalAmount,
  AppImageName.car,
  AppImageName.totalAmount,
  AppImageName.totalAmount
];
List<LeaderModels> leaderListDafult = [
  LeaderModels(
      createdAt: "dd",
      groupName: "dddss",
      id: 0,
      mobileNo: "dddd",
      name: "ddd"),
  LeaderModels(
      createdAt: "dd",
      groupName: "dddss",
      id: 0,
      mobileNo: "dddd",
      name: "ddd"),
  LeaderModels(
      createdAt: "dd",
      groupName: "dddss",
      id: 0,
      mobileNo: "dddd",
      name: "ddd"),
  LeaderModels(
      createdAt: "dd",
      groupName: "dddss",
      id: 0,
      mobileNo: "dddd",
      name: "ddd"),
];
