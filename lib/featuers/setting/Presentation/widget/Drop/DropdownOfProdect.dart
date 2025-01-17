import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/AddorderControll.dart';
import 'package:ican/featuers/setting/Presentation/Models/prodect.dart';
import 'package:skeletonizer/skeletonizer.dart';

OverlayEntry showDropdownOfProdect(BuildContext context1) {
  OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
    final AddOrderControll addOrderControll = Get.find();
    return Positioned(
        top: 150,
        bottom: 50,
        right: MediaQuery.sizeOf(context).width * 0.1,
        left: MediaQuery.sizeOf(context).width * 0.1,
        child: AnimatedBuilder(
            animation: addOrderControll.animationControllerprodect,
            builder: (context, child) => SlideTransition(
                  position: addOrderControll.positionProdect,
                  child: FadeTransition(
                    opacity: addOrderControll.opacityProdect,
                    child: child,
                  ),
                ),
            child: Align(
                child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(-4, 4),
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: bobyOfProdrct(),
                    )))));
  });
  return overlayEntry;
}

class bobyOfProdrct extends StatelessWidget {
  const bobyOfProdrct({super.key});

  @override
  Widget build(BuildContext context) {
    final AddOrderControll addOrderControll = Get.find();
    return SizedBox(
      //  height: 1000,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: SizedBox(
                          width: 35,
                          height: 30,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              addOrderControll.CloseDropOfProdect();
                            },
                          ),
                        ),
                        prefixIcon: IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // addOrderControll.CloseDropOfProdect();
                          },
                        ),
                        hintText: "بحث عن مواد",
                        hintStyle: TextStyle(
                          color: AppColor.primaryAppbar,
                          fontSize: 15,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AddOrderControll>(
              id: AddOrderControll.ProdectGet,
              builder: (addOrderControll) => Expanded(
                  child: Skeletonizer(
                enabled: addOrderControll.lodingProdect,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 30,
                  ),
                  itemCount: addOrderControll.prodectData.length,
                  itemBuilder: (context, index) => itemProdect(
                    prodectModels: addOrderControll.prodectData[index],
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class itemProdect extends StatelessWidget {
  const itemProdect({
    super.key,
    required this.prodectModels,
  });
  final ProdectModels prodectModels;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: AppColor.primaryAppbar,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  prodectModels.name,
                  style: ApptextStyle.textStyleApp20
                      .copyWith(color: Colors.white, fontSize: 15),
                ),
              ),
              Text(
                '${prodectModels.price}:السعر',
                style: ApptextStyle.textStyleApp20
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${prodectModels.price}: السعر الكلي',
                style: ApptextStyle.textStyleApp20
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
              Flexible(
                  child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                  Text(
                    "1",
                    style: ApptextStyle.textStyleApp20
                        .copyWith(color: Colors.white),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(Icons.remove),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
