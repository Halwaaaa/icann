import 'package:flutter/material.dart';
import 'package:ican/core/utlies/textStyle.dart';

class ItemInformtion extends StatelessWidget {
  const ItemInformtion({
    super.key,
    this.child,
    required this.titel,
    this.onTap,
  });
  final Widget? child;
  final String titel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(width: 30, child: child),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              titel,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: ApptextStyle.textStyleApp16,
            ),
          ),
        ],
      ),
    );
  }
}
