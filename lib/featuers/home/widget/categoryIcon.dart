import 'package:flutter/cupertino.dart';
import 'package:ican/core/utlies/image.dart';

class categoryIcon extends StatelessWidget {
  const categoryIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AppImageName.categoryShap,
          height: 40,
        ),
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImageName.categoryIcon,
              height: 25,
            ))
      ],
    );
  }
}
