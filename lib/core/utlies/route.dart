import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ican/core/compnated/CustomPageTransition.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/Drawrr/Presentation/controll/drawerControll.dart';
import 'package:ican/featuers/Drawrr/Presentation/view/about.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/login/Presentation/controll/loginControll.dart';
import 'package:ican/featuers/login/Presentation/view/loginView.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/mainLayout/Presentation/View/mainLayout.dart';
import 'package:ican/featuers/splashscreen/splash_screen.dart';

class Routers {
  static const String rhome = '/Rhome';
  static const String rsplach2 = '/Splach2';
  static const String rMainLoyout = '/rMainLoyout';
  static const String rLogin = '/rLogin';
  static const String rHomeView = '/SHomeView';
  static const String rSlachView = '/';
  static const String rAboutApp = '/rAboutApp';

  static List<GetPage<dynamic>> router = [
    GetPage(
      page: () => const SplashScreen(),
      bindings: [
        BindingsBuilder(() {
          //Get.lazyPut(() => LoginControll());
          //Get.lazyPut(() => ServicesDio());
          // Get.lazyPut(() => Mainlayoutcontroll());
          //Get.lazyPut(() => ControolHome());
          // Get.lazyPut(() => SearchControll());
          // Get.lazyPut(() => DrawerControllMain());
          // Get.lazyPut(() => AppBarControll());
          // Get.lazyPut(() => SettingControll());
          // Get.lazyPut(() => CustmorControll());
          // Get.lazyPut(() => SatutsControll());
          // Get.lazyPut(() => ());
        }),
      ],
      name: rSlachView,
    ),
    GetPage(
      name: rAboutApp,
      page: () => const AboutApp(),
      transition: Transition.fadeIn,
      // customTransition: CustomPageTransition(),
    ),
    GetPage(
      name: rMainLoyout,
      page: () => MainlayoutView(),
      transition: Transition.size,
      bindings: [
        BindingsBuilder.put(() => Mainlayoutcontroll()),
        BindingsBuilder.put(() => ControolHome()),
        BindingsBuilder.put(() => AppBarControll()),
        // BindingsBuilder.put(() => SearchControll()),
        BindingsBuilder.put(() => DrawerControllMain()),
        BindingsBuilder.put(() => GroupControll()),
        BindingsBuilder.put(() => CustmorControll()),
        BindingsBuilder.put(() => CustmorAndStaffControll()),
      ],
      customTransition: MyCustomTransition(),
    ),
    GetPage(
      name: rLogin,
      page: () => LoginView(),
      transition: Transition.cupertino,
      bindings: [BindingsBuilder.put(() => LoginControll())],
      customTransition: MyCustomTransition(),
    ),
  ];
}
