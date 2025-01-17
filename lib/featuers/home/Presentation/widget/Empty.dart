import 'package:flutter/cupertino.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.titel});
  final String titel;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
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
    );
  }
}
