import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShadowAnimationWidget extends StatefulWidget {
  const ShadowAnimationWidget({Key? key}) : super(key: key);

  @override
  _ShadowAnimationWidgetState createState() => _ShadowAnimationWidgetState();
}

class _ShadowAnimationWidgetState extends State<ShadowAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // مدة الحركة
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 200,
      child: CustomPaint(
        painter: LinePainter(_animation.value),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double progress;

  LinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2CA6DF)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    final path = Path();
    const quarter = 1 / 4;

    if (progress <= quarter) {
      // المرحلة الأولى: الخط من اليسار
      final hight = size.height * (progress / quarter);
      path.moveTo(0, -size.height);
      path.lineTo(0, -hight);
    } else {
      // الجزء من اليسار يبقى
      // path.moveTo(0, size.height);
      // path.lineTo(0, size.height);
    }

    if (progress > quarter && progress <= 2 * quarter) {
      // المرحلة الثانية: الخط للأعلى
      final wdith = size.width * ((progress - quarter) / quarter);
      if (wdith < size.width) {
        path.moveTo(0, 0);
        path.lineTo(wdith, 0);
      } else {
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
      }
    } else if (progress > 2 * quarter && progress < 3 / 4) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width * 0.3, 0);
      final height = size.height * ((progress - 2 * quarter) / (quarter));
      log(height.toString());
      path.moveTo(size.width, 0);
      // path.lineTo(size.width, 0);
      path.lineTo(size.width, height);

      // الجزء من الأعلى يبقى
      // path.moveTo(size.width / 2, size.height / 2);
      // path.lineTo(size.width / 2, 0);
    } else if (progress >= 3 / 4) {
      final wdith = size.width * ((progress - 3 * quarter) / (quarter));
      log(wdith.toString());
      path.moveTo(size.width, 0);
      path.lineTo(size.width * 0.3, 0);
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
      //path.moveTo(size.width, 0);
      path.moveTo(-wdith, 0);

      path.lineTo(1, size.height);
    }

    // if (progress > 2 * quarter && progress <= 3 * quarter) {
    //   // المرحلة الثالثة: الخط لليمين
    //   final width = size.width * ((progress - 2 * quarter) / quarter);
    //   path.moveTo(size.width / 2, 0);
    //   path.lineTo(size.width / 2 + width, 0);
    // } else if (progress > 3 * quarter) {
    //   // الجزء من اليمين يبقى
    //   path.moveTo(size.width / 2, 0);
    //   path.lineTo(size.width, 0);
    // }

    // if (progress > 3 * quarter) {
    //   // المرحلة الرابعة: الخط للأسفل
    //   final height = size.height * ((progress - 3 * quarter) / quarter);
    //   path.moveTo(size.width, 0);
    //   path.lineTo(size.width, height);
    // }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
