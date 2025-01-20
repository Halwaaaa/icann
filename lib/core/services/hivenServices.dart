import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/Responses/Presentation/Modles/ResponsesModels.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:ican/featuers/home/Presentation/models/OrderDatiles.dart';
import 'package:ican/featuers/home/Presentation/models/OrderSatutes.dart';
import 'package:ican/featuers/home/Presentation/models/StatmentModels.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';
import 'package:ican/featuers/home/Presentation/models/warehousesModels.dart';
import 'package:ican/featuers/setting/Presentation/Models/LeaderModels.dart';

class HivenServices extends GetxService {
  static String tokenId = 'tokenId';
  static String user = 'user';
  static String mybox = 'myBox';
  static String conters = 'conters';
  static String custmorName = 'CustmorName';
  static String custmorAll = 'custmorAll';
  static String wareList = 'wareList';
  static String WithdrawList = 'WithdrawList';
  static String staff = 'staff';
  static String custmorAllGroup = 'custmorAllGroup';
  static String group = 'group';
  static String orderSatutes = 'orderSatutes';
  static String orderSatutesGroup = 'orderSatutesGroup';
  static String statement = 'Statement';
  static String continued = 'Continued';
  static String recovered = 'Recovered';
  static String stautes = 'stautes';
  static String order = 'order';
  static String orderGroup = 'orderGroup';
  static String orderDaties = 'orderDaties';
  static String responsesAll = 'responsesAll';
  static String leaders = 'leaders';
  static String price = 'Price';
  static String priceTotle = 'PriceTolel';
  static String pricewithRemove = 'pricewithRemove';
  static String warehouseAll = 'warehouseAll';
  late Box box;
  late Box<User> userbox;
  late Box<List<CountersUser>> boxcon;
  Future<HivenServices> init() async {
    await Hive.initFlutter();

    await Hive.openBox(mybox);
    box = Hive.box(mybox);

    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(CountersAdapter());
    Hive.registerAdapter(StautesAdapter());
    Hive.registerAdapter(CustmorAdapter());
    Hive.registerAdapter(CustmorAllAdapter());
    Hive.registerAdapter(GroupUserAdapter());
    Hive.registerAdapter(OrderSatutesAdapter());
    Hive.registerAdapter(OrderModelsAdapter());
    Hive.registerAdapter(OrderDatilesAdapter());
    Hive.registerAdapter(ResponsesModelsAdapter());
    Hive.registerAdapter(StatementAdapter());
    Hive.registerAdapter(LeaderModelsAdapter());
    Hive.registerAdapter(warehousesAdapter());
    Hive.deleteBoxFromDisk(warehouseAll);
    userbox = await Hive.openBox(user);

    //userbox.delete(user);

    return this;
  }

  Future<Box<User>> getUser() async {
    if (!userbox.isOpen) {
      userbox = await Hive.openBox(user);
    }
    return userbox;
  }
}
