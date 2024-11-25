import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/utlies/color.dart';

class dafultBottun extends StatelessWidget {
  const dafultBottun({
    super.key,
    this.onPressed,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
          style: ButtonStyle(
              //  alignment: Alignment.center,
              backgroundColor: MaterialStateProperty.all(AppColor.dafultColor)

              //fixedSize: MaterialStateProperty.all()
              ),
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_right_alt_outlined),
          label: const Text(
            'Dive In',
            textDirection: TextDirection.rtl,
          )),
    );
  }
}
