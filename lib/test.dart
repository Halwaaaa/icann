import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedShadowWidget extends StatefulWidget {
  const AnimatedShadowWidget({super.key});

  @override
  State<AnimatedShadowWidget> createState() => _AnimatedShadowWidgetState();
}

class _AnimatedShadowWidgetState extends State<AnimatedShadowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ShadowPainter(progress: _animation.value),
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: const Text(
            'Shadow Box',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ShadowPainter extends CustomPainter {
  final double progress;

  ShadowPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final path = Path();

    final double perimeter = 2 * (size.width + size.height);
    final double position = progress * perimeter;

    if (position < size.width) {
      // أعلى
      path.moveTo(position, 0);
      path.lineTo(position + 10, 0);
    } else if (position < size.width + size.height) {
      // يمين
      path.moveTo(size.width, position - size.width);
      path.lineTo(size.width, position - size.width + 10);
    } else if (position < 2 * size.width + size.height) {
      // أسفل
      path.moveTo(
          size.width - (position - size.width - size.height), size.height);
      path.lineTo(
          size.width - (position - size.width - size.height) - 10, size.height);
    } else {
      // يسار
      path.moveTo(0, size.height - (position - 2 * size.width - size.height));
      path.lineTo(
          0, size.height - (position - 2 * size.width - size.height) - 10);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
