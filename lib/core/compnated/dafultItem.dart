import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ican/core/compnated/Doctrion.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:iconly/iconly.dart';

class dafultIetm extends StatefulWidget {
  const dafultIetm({
    super.key,
    required this.index,
    required this.Item,
    required this.heightOfShadowLeft,
    required this.wdith,
  });
  final int index;
  final Widget Item;
  final double heightOfShadowLeft;
  final double wdith;

  @override
  State<dafultIetm> createState() => _dafultIetmState();
}

class _dafultIetmState extends State<dafultIetm> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _firstShawedController;
  late final AnimationController _secondShawedController;
  late final AnimationController _thirdShawedController;
  late final AnimationController _FourthShawedController;
  late final AnimationController _FiFthShawedController;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fiestAnimation;
  late final Animation<double> _FourthAnimation;
  late final Animation<double> _FiFthAnimation;
  late final Animation<double> _secondAnimation;

  late final Animation<double> _thirdAnimation;
  bool isfirstShadow = false;
  bool isSecnedShadow = false;
  bool isThridShadow = false;
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
    controolAnimatd();
    // _controller.reset();
    // _controller.forward();
    //initAnimatedShadow();
    return AnimatedBuilder(
      animation: _controller,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
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
                      decoration: dafultDecoration(15,
                          shadow: const Color(0xFF2CA6DF),
                          offset: const Offset(-4, 0),
                          borderRadius: const BorderRadiusDirectional.vertical(
                            top: Radius.circular(15),
                          )),
                      width: 2,
                      height: widget.heightOfShadowLeft * _thirdAnimation.value,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Spacer(),
                            Container(
                              decoration: dafultDecoration(15,
                                  shadow: Colors.transparent,
                                  borderRadius:
                                      const BorderRadiusDirectional.horizontal(
                                          start: Radius.circular(15))),
                              height: 2,
                              width: widget.wdith * 0.3,
                            ),
                            AnimatedBuilder(
                              animation: _secondShawedController,
                              builder: (context, child) => Container(
                                  decoration: dafultDecoration(20,
                                      shadow: const Color(0xFF2CA6DF),
                                      borderRadius:
                                          const BorderRadiusDirectional
                                              .horizontal(
                                              start: Radius.circular(15))),
                                  height: 2,
                                  width: widget.wdith *
                                      0.69 *
                                      _secondAnimation.value),
                            ),
                          ],
                        ),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.transparent,
                                    )),
                                child: widget.Item)),
                        AnimatedBuilder(
                          animation: _FourthShawedController,
                          builder: (context, child) => Container(
                            decoration: dafultDecoration(15,
                                shadow: const Color(0xFF2CA6DF),
                                offset: const Offset(0, -3),
                                borderRadius:
                                    const BorderRadiusDirectional.horizontal(
                                        start: Radius.circular(15))),
                            height: 3,
                            width: widget.wdith * _FourthAnimation.value,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedBuilder(
                          animation: _FiFthShawedController,
                          builder: (context, child) {
                            return Container(
                              decoration: dafultDecoration(15,
                                  shadow: const Color(0xFF2CA6DF),
                                  offset: const Offset(2, 2),
                                  borderRadius:
                                      const BorderRadiusDirectional.vertical(
                                    top: Radius.circular(15),
                                  )),
                              width: 2,
                              height: _FiFthAnimation.value *
                                  widget.heightOfShadowLeft *
                                  0.2,
                            );
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedBuilder(
                      animation: _firstShawedController,
                      builder: (context, child) {
                        log(_fiestAnimation.value.toString());
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: dafultDecoration(15,
                                  shadow: const Color(0xFF2CA6DF),
                                  offset: const Offset(2, 2),
                                  borderRadius:
                                      const BorderRadiusDirectional.vertical(
                                    top: Radius.circular(15),
                                  )),
                              width: 2,
                              height: widget.heightOfShadowLeft -
                                  widget.heightOfShadowLeft *
                                      _fiestAnimation.value,
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
      duration: const Duration(milliseconds: 300),
    );
    _firstShawedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _secondShawedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _thirdShawedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _FourthShawedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _FiFthShawedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _controller.forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _fiestAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _firstShawedController, curve: Curves.easeIn),
    );
    _secondAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _secondShawedController, curve: Curves.easeIn),
    );
    _thirdAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _thirdShawedController, curve: Curves.easeIn),
    );
    _FourthAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _FourthShawedController, curve: Curves.easeIn),
    );
    _FiFthAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _FourthShawedController, curve: Curves.easeIn),
    );

    // Delay animation based on index
    //   Future.delayed(Duration(milliseconds: widget.index * 100), () {
    //     if (mounted) {
    //       print("ll");

    //     }
    //   });
  }

  void controolAnimatd() {
    _firstShawedController.reset();
    _secondShawedController.reset();
    _thirdShawedController.reset();
    _FiFthShawedController.reset();
    _FourthShawedController.reset();
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
        log("_FourthShawedController Start");
        _FourthShawedController.forward();
      }
    });
    _FourthShawedController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        log("_FourthShawedController Start");
        _FiFthShawedController.forward();
      }
    });
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
            duration: const Duration(microseconds: 1500),
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
