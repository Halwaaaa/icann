import 'package:flutter/material.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/itemInformtion.dart';

class DafultListInformation extends StatelessWidget {
  const DafultListInformation({
    super.key,
    required this.titel,
    required this.iconName,
  });
  final List<String> titel;
  final List<String?> iconName;

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        //            crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(titel.length, (index) {
          return ItemInformtion(
            onTap: () {},
            titel: titel[index],
            child: iconName[index] != null
                ? Image.asset(
                    iconName[index]!,
                    height: 20,
                  )
                : null,
          );
        }));
  }
}
