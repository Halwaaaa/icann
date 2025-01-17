import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShapOfDerop extends StatelessWidget {
  const ShapOfDerop({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Align(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 450,
              // maxHeight: 400,
            ),
          
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(-4, 4),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ));
  }
}
