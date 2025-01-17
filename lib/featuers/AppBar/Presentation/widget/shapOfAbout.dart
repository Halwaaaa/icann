import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/compnated/Doctrion.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';

class ShapOfAbout extends StatelessWidget {
  const ShapOfAbout({
    super.key,
    required this.appBarControll,
  });
  final AppBarControll appBarControll;

  @override
  Widget build(BuildContext context) {
    final SearchControll searchControll = Get.find();
    return SliverAppBar(
      expandedHeight: 100,
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      elevation: 0.0,
      backgroundColor: Colors.white,
      floating: false,
      pinned: false,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Visibility(
          visible: !appBarControll.isAppBarDone ? true : false,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  height: 20,
                  child: Container(color: AppColor.primaryAppbar)),
              Positioned(
                top: -75,

                /// height: 200,
                width: MediaQuery.sizeOf(context).width,
                child: CustomPaint(
                  size: Size(60, MediaQuery.sizeOf(context).width),
                  painter: HalfCirclePainter(
                      radius: 60, color: AppColor.primaryAppbar),
                  child: Container(
                    height: 20,
                    color: AppColor.primaryAppbar,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: MediaQuery.sizeOf(context).width * 0.1,
                right: MediaQuery.sizeOf(context).width * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.25), // لون الظل مع الشفافية
                        offset: const Offset(0, 4), // اتجاه الظل
                        blurRadius: 4, // مدى انتشار الظل
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Image.asset(
                        AppImageName.icanLogo,
                        height: 45,
                      ),
                    ),
                    //backgroundImage: AssetImage(AppImageName.icanLogo,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final double radius;
  final Color color;

  HalfCirclePainter({required this.radius, this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0;

    // مركز الدائرة
    final center = Offset(size.width / 2, size.height / 2);

    // المستطيل الذي يحتوي الدائرة
    final rect = Rect.fromLTWH(
      0, // يبدأ من الحافة اليسرى
      0, // في النصف السفلي للشاشة
      size.width, // يمتد على عرض الشاشة
      150, // ارتفاعه يساوي نصف الشاشة
    );

    // رسم نصف دائرة للأسفل
    canvas.drawArc(
      rect,
      0, // زاوية البداية (180 درجة)
      pi, // الزاوية المغطاة (180 درجة أخرى)
      true, // عدم ربط القوس بالمركز
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
