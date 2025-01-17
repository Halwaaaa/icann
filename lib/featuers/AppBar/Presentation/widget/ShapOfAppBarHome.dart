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

class ShapOfAppBarHome extends StatelessWidget {
  const ShapOfAppBarHome({
    super.key,
    required this.appBarControll,
  });
  final AppBarControll appBarControll;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SearchControll>(() => SearchControll());
    final SearchControll searchControll = Get.find();
    return SliverAppBar(
      expandedHeight: 90,
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
                top: -50,
                width: MediaQuery.sizeOf(context).width,
                child: CustomPaint(
                  size: Size(50, MediaQuery.sizeOf(context).width),
                  painter: HalfCirclePainter(
                      radius: 50, color: AppColor.primaryAppbar),
                ),
              ),
              Positioned(
                  top: 10,
                  left: MediaQuery.sizeOf(context).width * 0.1,
                  right: MediaQuery.sizeOf(context).width * 0.1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 450,
                      ),
                      child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: dafultDecoration(50,
                              shadow: Colors.black12, color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    textDirection: TextDirection.ltr,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.search)),
                                      //const Spacer(),
                                      Expanded(
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          controller:
                                              searchControll.searchController,
                                          onChanged: (value) {
                                            searchControll.update([
                                              SearchControll.saerch,
                                              SearchControll.custmorSearch
                                            ]);
                                          },
                                          onFieldSubmitted: (value) {
                                            searchControll.update([
                                              SearchControll.saerch,
                                              SearchControll.custmorSearch
                                            ]);
                                          },
                                          decoration: InputDecoration(
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              hintText: "بحث",
                                              hintStyle:
                                                  ApptextStyle.textStyleApp20),
                                        ),
                                      ),
                                      //  const Spacer(),
                                      SizedBox(
                                        width: 50,
                                        child: GestureDetector(
                                          key: searchControll.dropdownKeySearch,
                                          onTap: () {
                                            searchControll.openDropOfSearch(
                                                context, searchControll);
                                          },
                                          child: Image.asset(
                                            AppImageName.AppbarCategry,
                                            height: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ))
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
      100, // ارتفاعه يساوي نصف الشاشة
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
