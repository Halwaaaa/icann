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
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;

    return Positioned(
        top: 150,
        bottom: 20 + bottomInsets,
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
            GetBuilder<AddOrderControll>(
              id: AddOrderControll.prodect,
              builder: (addOrderControll) => Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    child: TextFormField(
                      controller: addOrderControll.searchController,
                      onChanged: (value) =>
                          addOrderControll.searchProdect(value),
                      decoration: InputDecoration(
                          suffixIcon: SizedBox(
                            width: 35,
                            height: 30,
                            child: IconButton(
                              icon: Icon(
                                  addOrderControll.prodectcountSelected.isEmpty
                                      ? Icons.close
                                      : Icons.add),
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
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AddOrderControll>(
              id: AddOrderControll.ProdectGet,
              builder: (addOrderControll) => Expanded(
                  child: Skeletonizer(
                enabled: addOrderControll.lodingProdect,
                child: Column(
                  children: [
                    GetBuilder<AddOrderControll>(
                      id: AddOrderControll.prodect,
                      builder: (controller) => Text(
                          " سعر المنتجات الكلي  : " +
                              controller.totalPricrOrder.toString(),
                          style: TextStyle(
                            color: AppColor.primaryAppbar,
                            fontSize: 15,
                          )),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: addOrderControll.prodectData.length,
                        itemBuilder: (context, index) =>
                            GetBuilder<AddOrderControll>(
                          id: AddOrderControll.prodect,
                          builder: (controller) {
                            return itemProdect(
                              index: index,
                              prodectModels:
                                  addOrderControll.prodectData[index],
                              count: addOrderControll.prodectcount[index].qty,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
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
    required this.count,
    required this.index,
  });
  final ProdectModels prodectModels;
  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    final AddOrderControll addOrderControll = Get.find();
    final bool show = addOrderControll.prodectSerchId.isEmpty ||
        addOrderControll.prodectSerchId.contains(prodectModels.id);
    return show
        ? Container(
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                color: AppColor.primaryAppbar,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  textDirection: TextDirection.ltr,
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
                      'السعر: ${prodectModels.price}',
                      style: ApptextStyle.textStyleApp20
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      'السعر الكلي : ${prodectModels.price * count}',
                      style: ApptextStyle.textStyleApp20
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      'الكمية المتوفرة : ${prodectModels.count}',
                      style: ApptextStyle.textStyleApp20
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                    Flexible(
                        flex: 2,
                        child: Row(
                          spacing: 25,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                addOrderControll.addProdect(index);
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: Center(
                                  child: FittedBox(child: Icon(Icons.add)),
                                ),
                              ),
                            ),
                            Text(
                              count.toString(),
                              style: ApptextStyle.textStyleApp20
                                  .copyWith(color: Colors.white),
                            ),
                            InkWell(
                              onTap: () {
                                addOrderControll.removeProdect(index);
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: FittedBox(
                                  child: Center(
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
