import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration dafultDecoration(double raduis) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(raduis)),
    shape: BoxShape.rectangle,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0, 5),
        blurRadius: 24,
        spreadRadius: 0,
      ),
    ],
    border: Border.all(
      width: 1.0,
      color: const Color.fromRGBO(0, 0, 0, 0.1),
    ),
  );
}
