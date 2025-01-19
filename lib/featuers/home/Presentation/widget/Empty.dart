import 'package:flutter/cupertino.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.titel});
  final String titel;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: TweenAnimationBuilder(
        duration: Duration(seconds: 2),
        tween: Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset(0, 0),
        ),
        builder: (context, value, child) {
          return Transform.translate(
            offset: value, // تحريك العنصر
            child: child,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: FittedBox(
                child: Text(
                  titel,
                  style: ApptextStyle.textStyleApp24Selcted.copyWith(
                      color: AppColor.navyBlue,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
