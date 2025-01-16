import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AnimatedNotificationItem extends StatelessWidget {
  final int index;
  final bool isHighlighted;
  final VoidCallback onTap;

  const AnimatedNotificationItem({
    super.key,
    required this.index,
    required this.isHighlighted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0.2, end: 0.0),
      builder: (context, double opacity, child) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(isHighlighted ? 0.5 : 0.2 + opacity),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Row(
                children: [
                  const Icon(
                    IconlyLight.notification,
                    size: 30,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Item $index',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
