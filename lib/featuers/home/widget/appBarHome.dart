import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/image.dart';
import 'package:ican/core/utlies/textStyle.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        floating: true,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0.0,
        snap: true,
        toolbarHeight: 100,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 40,
              bottom: 10,
            ),
            child: Row(
              children: [
                Image.asset(
                  AppImageName.HomeIconDrawer,
                  color: AppColor.dafultColor,
                  height: 23,
                  width: 23,
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.abc, size: 40),
                ),
                const Spacer(),
                Text(
                  "الريئيسة",
                  style:
                      GoogleFonts.amiri(textStyle: ApptextStyle.textStyleApp24),
                ),
                const Spacer(),
                Image.asset(
                  AppImageName.HomeImageUser,
                  height: 46,
                  width: 46,
                ),
              ],
            ),
          ),
        ));
  }
}
