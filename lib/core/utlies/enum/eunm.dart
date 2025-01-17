import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:iconly/iconly.dart';

enum enumCategory {
  CustomerManagement,
  Account,
  Accounting,
  OrderStatus,
  Gruop,
  Mian,
  Review,
  ArchiveStorage;

  @override
  String toString() {
    switch (this) {
      case enumCategory.ArchiveStorage:
        return AppText.ArchiveStorage.tr;
      case enumCategory.Account:
        return AppText.Account.tr;
      case enumCategory.Mian:
        return AppText.main.tr;
      case enumCategory.Gruop:
        return AppText.group.tr;
      case enumCategory.CustomerManagement:
        return AppText.CustomerManagement.tr;
      case enumCategory.OrderStatus:
        return AppText.OrderStatus.tr;
      case enumCategory.Accounting:
        return AppText.Accounting.tr;
      case enumCategory.Review:
        return AppText.Review.tr;
    }
  }
}

extension MyIconsExtension on enumCategory {
  String get Icon {
    switch (this) {
      case enumCategory.ArchiveStorage:
        return AppImageName.ArchiveStorage;
      case enumCategory.Account:
        return AppImageName.Account;
      case enumCategory.Mian:
        return AppText.AppBarHome.tr;
      case enumCategory.OrderStatus:
        return AppImageName.OrderStatus;
      case enumCategory.Gruop:
        return AppImageName.group;

      case enumCategory.Accounting:
        return AppImageName.Accounting;
      case enumCategory.Review:
        return AppImageName.Review;
      case enumCategory.CustomerManagement:
        return AppImageName.Customer;
    }
  }

  String get label {
    switch (this) {
      case enumCategory.Mian:
        return AppText.AppBarHome.tr;
      case enumCategory.OrderStatus:
        return AppText.OrderStatus.tr;
      case enumCategory.ArchiveStorage:
        return AppText.ArchiveStorage.tr;
      case enumCategory.Account:
        return AppText.Account.tr;
      case enumCategory.Gruop:
        return AppText.group.tr;
      case enumCategory.CustomerManagement:
        return AppText.CustomerManagement.tr;
      case enumCategory.Accounting:
        return AppText.Accounting.tr;
      case enumCategory.Review:
        return AppText.Review.tr;
    }
  }
}
