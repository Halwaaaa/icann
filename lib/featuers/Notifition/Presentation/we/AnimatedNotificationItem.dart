import 'package:flutter/material.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:iconly/iconly.dart';

class AnimatedNotificationItem extends StatelessWidget {
  final int index;
  final bool isHighlighted;
  final VoidCallback onTap;
  final String titel;

  const AnimatedNotificationItem({
    super.key,
    required this.index,
    required this.isHighlighted,
    required this.onTap,
    required this.titel,
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        IconlyLight.notification,
                        size: 30,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'المركز',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColor.primaryAppbar,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(titel),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ],
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
