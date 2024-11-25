import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ican/featuers/home/View/homeView.dart';
import 'package:ican/featuers/home/controol/controolHome.dart';

class Routers {
  static const String Rhome = '/';
  static const String Rsplach2 = '/Splach2';
  static const String RHomeView = '/SHomeView';

  static List<GetPage<dynamic>> router = [
    GetPage(
      page: () => const HomeView(),
      bindings: [BindingsBuilder.put(() => controolHome())],
      name: Rhome,
    ),
    // GetPage(
    //   name: Rsplach2,
    //   page: () => const SplachView2(),
    //   transition: Transition.cupertino,
    //   customTransition: CustomPageTransition(),
    // ),
    // GetPage(
    //   name: RHomeView,
    //   page: () => const HomeView(),
    //   transition: Transition.cupertino,
    //   bindings: [BindingsBuilder.put(() => controllHome())],
    //   customTransition: CustomPageTransition(),
    // ),
  ];
}
