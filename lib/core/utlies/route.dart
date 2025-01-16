import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/Drawrr/Presentation/controll/drawerControll.dart';
import 'package:ican/featuers/Drawrr/Presentation/view/about.dart';
import 'package:ican/featuers/Notifition/Presentation/View/NotificationView.dart';
import 'package:ican/featuers/home/Presentation/View/homeView.dart';
import 'package:ican/featuers/home/Presentation/View/homeView1.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CityControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/featuers/home/Presentation/widget/ttt.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/mainLayout/Presentation/View/mainLayout.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';
import 'package:ican/test.dart';

class Routers {
  static const String rhome = '/Rhome';
  static const String rsplach2 = '/Splach2';
  static const String rHomeView = '/SHomeView';
  static const String rMaimLayout = '/';
  static const String rAboutApp = '/rAboutApp';

  static List<GetPage<dynamic>> router = [
    GetPage(
      page: () => MainlayoutView(),
      bindings: [
        BindingsBuilder(() {
          Get.lazyPut(() => Mainlayoutcontroll());
          //Get.lazyPut(() => ControolHome());
          Get.lazyPut(() => SearchControll());
          Get.lazyPut(() => DrawerControllMain());
          Get.lazyPut(() => AppBarControll());
          Get.lazyPut(() => SettingControll());
          Get.lazyPut(() => CustmorControll());
          Get.lazyPut(() => SatutsControll());
          // Get.lazyPut(() => ());
        }),
      ],
      name: rMaimLayout,
    ),

    GetPage(
      name: rAboutApp,
      page: () => const AboutApp(),
      transition: Transition.fadeIn,
      // customTransition: CustomPageTransition(),
    ),
    // GetPage(
    //   name: RHomeView,
    //   page: () => const HomeView(),
    //   transition: Transition.cupertino,
    //   bindings: [BindingsBuilder.put(() => controllHome())],
    //   customTransition: CustomPageTransition(),
    // ),
  ];
}
