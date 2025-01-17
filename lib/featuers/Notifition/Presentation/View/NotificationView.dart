import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/Notifition/Presentation/we/AnimatedNotificationItem.dart';
import 'package:ican/featuers/home/Presentation/widget/SarchAnimated.dart';
import 'package:iconly/iconly.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final ScrollController _scrollController = ScrollController();
  final int _highlightedIndex = -1;
  late bool isSearchActive;
  @override
  void initState() {
    // TODO: implement initState
    isSearchActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> id = [205, 52, 4, 4, 2];
    return SliverMainAxisGroup(
      slivers: [
        // SliverAppBar(
        //   pinned: true,
        //   backgroundColor: Colors.blue[50],
        //   elevation: 0.0,
        //   title: TextFieldSearchAnimted(
        //     isSearchActive: isSearchActive,
        //   ),
        //   //leadingWidth: 100,
        //   actions: [
        //     IconButton(
        //       icon: Icon(
        //         isSearchActive ? Icons.close : Icons.search,
        //         color: Colors.black,
        //       ),
        //       onPressed: () {
        //         setState(() {
        //           isSearchActive = !isSearchActive;
        //         });
        //       },
        //     ),
        //   ],

        //   leading: const Icon(
        //     Icons.arrow_back_ios,
        //     size: 25,
        //     color: Colors.black,
        //   ),
        // ),
        // SliverToBoxAdapter(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       const SizedBox(
        //         height: 30,
        //       ),
        //       Text(
        //         AppText.Notifications.tr,
        //         style: ApptextStyle.textStyleApp16,
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //     ],
        //   ),
        // ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // final isHighlighted = index == _highlightedIndex;
                return AnimatedNotificationItem(
                  index: index,
                  titel: "    تم تعديل الطلب رقم: ${id[index]}",
                  isHighlighted: index == _highlightedIndex,
                  onTap: () {
                    // setState(() {
                    //   _highlightedIndex = index;
                    // });
                    // _scrollToIndex(index);
                  },
                );
              },
              childCount: 5,
            ),
          ),
        ),
      ],
    );
  }

  void _scrollToIndex(int index) {
    const itemHeight = 66.0; // ارتفاع العنصر مع الحواف
    final targetOffset = index * itemHeight;
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
