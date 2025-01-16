import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration dafultDecoration(
  double raduis, {
  Color? color,
  required Color shadow,
  Offset? offset,
  BorderRadiusGeometry? borderRadius,
}) {
  return BoxDecoration(
    color: color ?? Colors.transparent,
    borderRadius: BorderRadius.circular(raduis),
    //  shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: shadow,
        offset: offset ?? const Offset(0, 4),
        //const Offset(0, 4),

        blurRadius: 2,
        spreadRadius: 0,
      ),
    ],
  );
}
