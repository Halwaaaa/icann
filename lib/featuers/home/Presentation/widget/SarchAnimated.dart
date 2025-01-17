import 'package:flutter/material.dart';

class TextFieldSearchAnimted extends StatelessWidget {
  const TextFieldSearchAnimted({super.key, required this.isSearchActive});
  final bool isSearchActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        duration: const Duration(milliseconds: 300),
        width: isSearchActive ? 400 : 0,
        height: 40,
        child: Center(
          child: isSearchActive
              ? const TextField(
                  decoration: InputDecoration(
                    hintText: 'ابحث هنا...',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                )
              : null,
        ));
  }
}
