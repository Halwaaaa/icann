import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/AddorderControll.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Stautes.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/countersAndStateLaeder.dart';

class ListAddOrder extends StatelessWidget {
  const ListAddOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final AddOrderControll addOrderControll = Get.put(AddOrderControll());

    addOrderControll.animationController.reset();
    addOrderControll.animationController.forward();
    addOrderControll.getProdect();
    return SliverSafeArea(
        sliver: SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: AnimatedBuilder(
              animation: addOrderControll.animationController,
              builder: (context, child) => FadeTransition(
                opacity: addOrderControll.opacity,
                child: SlideTransition(
                  position: addOrderControll.position,
                  child: child,
                ),
              ),
              child: SingleChildScrollView(
                child: BobyOfAddOrder(),
              ),
            )));
  }
}

class BobyOfAddOrder extends StatelessWidget {
  const BobyOfAddOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final AddOrderControll addOrderControll = Get.find();

    return Directionality(
        textDirection: TextDirection.ltr,
        child: Align(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: SizedBox(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 30),
                        child: Column(spacing: 20, children: [
                          Column(spacing: 20, children: [
                            // TextAddOrder(
                            //     textEditingController:
                            //         addOrderControll.textNamEmployee,
                            //     titel: 'اسم الموظف',
                            //     icon: Icon(Icons.person)),
                            TextAddOrder(
                                textEditingController:
                                    addOrderControll.textNamClient,
                                titel: 'اسم الزبون',
                                icon: Icon(Icons.person)),
                            TextAddOrder(
                                textEditingController:
                                    addOrderControll.textNaumberClient,
                                titel: 'هاتف الزبون',
                                icon: Icon(Icons.phone)),
                            TextAddOrder(
                                textEditingController:
                                    addOrderControll.textNaumber2Client,
                                titel: '  هاتف الزبون الثاني',
                                icon: Icon(Icons.phone)),
                            TextAddOrder(
                                textEditingController:
                                    addOrderControll.textNaumberWhatAppClient,
                                titel: 'واتساب الزبون',
                                icon: Icon(Icons.phone)),
                            CountersAndStateLaeder(
                              isAddorder: true,
                            ),
                            //  CountersAndStateLaeder(isAddorder: true),
                            stautes(isAdd: true),
                            TextAddOrder(
                                textEditingController:
                                    addOrderControll.textAddresClient,
                                titel: 'الموقع',
                                icon: Image.asset(AppImageName.address)),

                            TextAddOrder(
                                textEditingController:
                                    addOrderControll.texttotalAmount,
                                titel: 'المبلغ الكلي',
                                icon: Image.asset(AppImageName.totalAmount)),

                            TextAddOrder(
                                textEditingController:
                                    addOrderControll.textNotes,
                                titel: 'الملاحظات',
                                icon: Icon(Icons.phone)),
                            DadfultBoutton(
                              onTap: () {
                                addOrderControll.openDropOfProdrct(context);
                                // leaderGroupControll.tapAddLaedr(context);
                              },
                              title: "اضافة منتجات ",
                              ColorSelected: Colors.white,
                              fillColor: AppColor.Catrgray,
                            ),
                            DadfultBoutton(
                              onTap: () {
                                addOrderControll.GetFileStorge(context);
                                // leaderGroupControll.tapAddLaedr(context);
                              },
                              title: "اضافة الطلب ",
                              ColorSelected: Colors.white,
                              fillColor: AppColor.Catrgray,
                            ),
                          ])
                        ]))))));
  }
}

class TextAddOrder extends StatefulWidget {
  const TextAddOrder({
    super.key,
    required this.textEditingController,
    this.keyboardType,
    required this.titel,
    required this.icon,
  });
  final TextInputType? keyboardType;

  final TextEditingController textEditingController;
  final String titel;
  final Widget? icon;

  @override
  State<TextAddOrder> createState() => _TextAddOrderState();
}

class _TextAddOrderState extends State<TextAddOrder> {
  bool isFouces = false;

  late FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        isFouces = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DadfultBoutton(
      keyboardType: widget.keyboardType,
      onTap: () {
        // leaderGroupControll.scrollToIndex(index);
      },
      focusNode: focusNode,
      isTextFormFiled: true,
      controllerText: widget.textEditingController,
      title: isFouces ? "" : widget.titel,
      ColorSelected: isFouces ? AppColor.primaryAppbar : AppColor.Catrgray,
      colorBorder: isFouces ? AppColor.primaryAppbar : AppColor.Catrgray,
      icon: widget.icon,
    );
  }
}
