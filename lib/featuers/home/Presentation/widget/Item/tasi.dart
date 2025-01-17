import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // خلفية ملونة
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      // تأثير التشويش مع الظل
      Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // زوايا مستديرة
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.transparent, // خلفية نصف شفافة
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(41, 64, 144, 0.3), // لون الظل
                      offset: Offset(4, -4), // اتجاه الظل
                      blurRadius: 4, // مدى التشويش في الظل
                    ),
                  ],
                ),
              )))
    ]);
  }
}
