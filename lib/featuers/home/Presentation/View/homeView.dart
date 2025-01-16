// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ican/core/utlies/Modules.dart';
// import 'package:ican/core/utlies/color.dart';
// import 'package:ican/core/utlies/image.dart';
// import 'package:ican/core/utlies/mathed.dart';
// import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
// import 'package:ican/core/compnated/dafultItem.dart';
// import 'package:ican/featuers/home/Presentation/widget/appBarHome.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     final ControolHome controolHome = Get.find();

//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
//       body: CustomScrollView(slivers: [
//         //const AppBarHome(),
//         SliverAppBar(
//           expandedHeight: Mathed.ResponcvImages(context),
//           // floating: true,
//           flexibleSpace: FlexibleSpaceBar(
//             background: Container(
//               clipBehavior: Clip.hardEdge,
//               decoration: BoxDecoration(
//                   color: AppColor.SacendPrimary,
//                   image: const DecorationImage(
//                       image: AssetImage(AppImageName.BackgroundAppbar)),
//                   borderRadius:
//                       const BorderRadius.only(bottomLeft: Radius.circular(60))),
//             ),
//           ),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//           sliver: SliverToBoxAdapter(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Image.asset(
//                     AppImageName.logo,
//                     scale: 2,
//                     height: 100,
//                     width: 100,
//                   ),
//                 ),
//                 //  const TitleHome(),
//                 // kkkk
//                 Mathed.heightSmal(),
//                 // Mathed.heightSmal(),
//               ],
//             ),
//           ),
//         ),
//         GetBuilder<ControolHome>(builder: (controller) {
//           double screenWidth = MediaQuery.of(context).size.width;

//           bool isTablet = screenWidth >= 600;

//           int crossAxisCount = isTablet ? 3 : 2;
//           double itemHeight = isTablet ? 250 : 200;
//           double itemWidth = screenWidth / crossAxisCount;

//           return SliverPadding(
//             padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//             sliver: SliverGrid.builder(
//               itemCount: ModulesCategory.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: itemWidth / itemHeight,
//                   crossAxisCount: crossAxisCount,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10),
//               itemBuilder: (context, index) {
//                 return dafultIetm(
//                   index: index,
//                   Item: const Text("l"),
//                 );
//               },
//             ),
//           );
//         })
//       ]),
//     );
//   }
// }

// class CustomSliverAppBarShape extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height); // البداية من الزاوية السفلية اليسرى
//     path.lineTo(
//         0, 60); // الانتقال إلى نقطة أعلى قليلاً من الزاوية العلوية اليسرى
//     path.quadraticBezierTo(
//       size.width / 2, 0, // نقطة التحكم (منتصف العرض مع انحناء لأسفل)
//       size.width, 60, // نقطة النهاية (أعلى الزاوية اليمنى مع نفس الارتفاع)
//     );
//     path.lineTo(size.width, size.height); // إغلاق المسار
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
