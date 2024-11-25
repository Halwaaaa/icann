import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/compnated/Doctrion.dart';

class Test extends StatefulWidget {
  const Test({super.key, required this.index});
  final int index;

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimated();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        decoration: dafultDecoration(15),
      ),
      builder: (context, child) =>
          SlideTransition(position: _offsetAnimation, child: child),
    );
  }

  void initAnimated() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 4), // Start from below
      end: Offset.zero, // End at original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();

    // Delay animation based on index
    //   Future.delayed(Duration(milliseconds: widget.index * 100), () {
    //     if (mounted) {
    //       print("ll");

    //     }
    //   });
  }
}
