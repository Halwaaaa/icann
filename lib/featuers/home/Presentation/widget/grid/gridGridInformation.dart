// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';

// class gridCustmorinfomation extends StatelessWidget {
//   const gridCustmorinfomation({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ControolHome controolHome = Get.find();

//     double screenWidth = MediaQuery.of(context).size.width;

//     bool isTablet = screenWidth >= 600;

//     int crossAxisCount = isTablet ? 3 : 2;
//     double itemHeight = isTablet ? 200 : 150;
//     double itemWidth = screenWidth / crossAxisCount - 35;

//     List<String> titel = modulesCategoryCustmor;
//     List<String> icon = modulesIconCustmor;

//     return GridCategories(
//       onTap: (index) {},
//       crossAxisCount: crossAxisCount,
//       icon: icon,
//       titel: titel,
//       itemHeight: itemHeight,
//       itemWidth: itemWidth,
//     );
//   }
// }
