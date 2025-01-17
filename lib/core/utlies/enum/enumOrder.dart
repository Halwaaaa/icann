import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';

enum Enumorder {
  notSure,
  withTheBrancSent,
  withTheBranchReceived,
  handling,
  withCenter,

  sure,
  refusal,
  resend
}

extension MyIconsExtensions on Enumorder {
  String get label {
    switch (this) {
      case Enumorder.handling:
        return AppText.handling;
      case Enumorder.notSure:
        return AppText.notSure;
      case Enumorder.refusal:
        return AppText.refusal;
      case Enumorder.resend:
        return AppText.resend;

      case Enumorder.sure:
        return AppText.sure;
      case Enumorder.withCenter:
        return AppText.withCenter;
      case Enumorder.withTheBrancSent:
        return AppText.withTheBrancSent;
      case Enumorder.withTheBranchReceived:
        return AppText.withTheBranchReceived;
    }
  }
}

enum EnumorderIetm {
  order,
  sendingBranch,
  receivingBranch,
  nameEmployee,
  orderNumber,
  nameClient,
  phoneClient,
  phoneEmployee,
}

extension MyIconsExtension1 on EnumorderIetm {
  String get label {
    switch (this) {
      case EnumorderIetm.order:
        return AppText.order;
      case EnumorderIetm.sendingBranch:
        return AppText.sendingBranch;
      case EnumorderIetm.receivingBranch:
        return AppText.receivingBranch;
      case EnumorderIetm.nameEmployee:
        return AppText.nameEmployee;
      case EnumorderIetm.orderNumber:
        return AppText.orderNumber;
      case EnumorderIetm.nameClient:
        return AppText.nameClient;

      case EnumorderIetm.phoneClient:
        return AppText.phoneClient;
      case EnumorderIetm.phoneEmployee:
        return AppText.phoneEmployee;
    }
  }
}
