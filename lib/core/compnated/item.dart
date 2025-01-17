import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/compnated/Doctrion.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';

class Ietm extends StatefulWidget {
  const Ietm({
    super.key,
    this.index,
    required this.Item,
    required this.heightOfShadowLeft,
    required this.wdith,
    this.isSelected = true,
  });
  final int? index;
  final Widget Item;
  final double heightOfShadowLeft;
  final double wdith;
  final bool isSelected;

  @override
  State<Ietm> createState() => _dafultIetmState();
}

class _dafultIetmState extends State<Ietm> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _firstShawedController;
  late final AnimationController _secondShawedController;
  late final AnimationController _thirdShawedController;
  // ignore: non_constant_identifier_names
  late final AnimationController _FourthShawedController;
  late final AnimationController _FiFthShawedController;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fiestAnimation;
  late final Animation<double> _FourthAnimation;
  late final Animation<double> _FiFthAnimation;
  late final Animation<double> _secondAnimation;

  late final Animation<double> _thirdAnimation;
  final bool isfirstShadow = false;
  final bool isSecnedShadow = false;
  final bool isThridShadow = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initAnimated();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _FiFthShawedController.dispose();
    _secondShawedController.dispose();
    _firstShawedController.dispose();
    _thirdShawedController.dispose();
    _FourthShawedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.isSelected ? controolAnimatd() : reset();
    // _controller.reset();
    // _controller.forward();
    //initAnimatedShadow();
    return AnimatedBuilder(
      animation: _controller,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  AnimatedBuilder(
                    animation: _thirdShawedController,
                    builder: (context, child) => Container(
                      decoration: dafultDecoration(50,
                          shadow: const Color(0xFF2CA6DF),
                          offset: const Offset(-4, 1),
                          borderRadius: const BorderRadiusDirectional.vertical(
                            top: Radius.circular(50),
                          )),
                      width: 2,
                      height: widget.heightOfShadowLeft * _thirdAnimation.value,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AnimatedBuilder(
                          animation: _secondShawedController,
                          builder: (context, child) => Container(
                              decoration: dafultDecoration(20,
                                  shadow: const Color(0xFF2CA6DF),
                                  borderRadius:
                                      const BorderRadiusDirectional.horizontal(
                                          start: Radius.circular(50))),
                              height: 2,
                              width: widget.wdith * _secondAnimation.value),
                        ),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: widget.isSelected
                                          ? Colors.transparent
                                          : AppColor.Catrgray,
                                    )),
                                child: widget.Item)),
                        AnimatedBuilder(
                          animation: _FourthShawedController,
                          builder: (context, child) => Container(
                            decoration: dafultDecoration(50,
                                shadow: const Color(0xFF2CA6DF),
                                offset: const Offset(0, -3),
                                borderRadius:
                                    const BorderRadiusDirectional.horizontal(
                                        start: Radius.circular(50))),
                            height: 3,
                            width: widget.wdith * _FourthAnimation.value,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedBuilder(
                      animation: _firstShawedController,
                      builder: (context, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: dafultDecoration(50,
                                      shadow: const Color(0xFF2CA6DF),
                                      offset: const Offset(2, 2),
                                      borderRadius:
                                          const BorderRadiusDirectional
                                              .vertical(
                                        top: Radius.circular(50),
                                      )),
                                  width: 2,
                                  height: widget.heightOfShadowLeft *
                                      _fiestAnimation.value,
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      builder: (context, child) {
        return SlideTransition(
            position: _offsetAnimation,
            child: SizedBox(
              height: widget.heightOfShadowLeft,
              width: widget.wdith,
              child: child,
            ));
      },
    );
  }

  void initAnimated() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _firstShawedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _secondShawedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _thirdShawedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _FourthShawedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _FiFthShawedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _controller.forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    _fiestAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _firstShawedController, curve: Curves.ease),
    );
    _secondAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _secondShawedController, curve: Curves.ease),
    );
    _thirdAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _thirdShawedController, curve: Curves.ease),
    );
    _FourthAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _FourthShawedController, curve: Curves.ease),
    );
    _FiFthAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _FourthShawedController, curve: Curves.ease),
    );

    // Delay animation based on index
    //   Future.delayed(Duration(milliseconds: widget.index * 100), () {
    //     if (mounted) {
    //       print("ll");

    //     }
    //   });
  }

  void controolAnimatd() {
    reset();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _firstShawedController.forward();
      }
    });
    _firstShawedController.forward();

    _firstShawedController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _secondShawedController.forward();
      }
    });
    _secondShawedController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _thirdShawedController.forward();
      }
    });
    _thirdShawedController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _FourthShawedController.forward();
      }
    });
    _FourthShawedController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _firstShawedController.reset();
        _secondShawedController.reset();
        _thirdShawedController.reset();
        _FiFthShawedController.reset();
        _FourthShawedController.reset();
        _firstShawedController.forward();
      }
    });
    _FiFthShawedController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        log("_FourthShawedController Start");
        //controolAnimatd();
      }
    });
  }

  void reset() {
    _firstShawedController.reset();
    _secondShawedController.reset();
    _thirdShawedController.reset();
    _FiFthShawedController.reset();
    _FourthShawedController.reset();
  }
}

class item1 extends StatelessWidget {
  const item1({
    super.key,
    required this.titel,
    required this.Count,
    required this.iconData,
  });
  final String titel;
  final int Count;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: AppColor.primary,
          size: 24.0,
        ),
        Text(
          titel,
          style: ApptextStyle.textStyleApp16,
        ),
        const SizedBox(
          height: 10,
        ),
        TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: Count),
            duration: const Duration(microseconds: 500),
            builder: (context, value, child) => Text(
                  value.toString(),
                  style: ApptextStyle.textStyleApp16,
                )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
