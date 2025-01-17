import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultInformationOneClomun.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';

class StoreList extends StatelessWidget {
  const StoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AcountControll>(
        id: AcountControll.store,
        builder: (acountControll) {
          return SliverMainAxisGroup(slivers: [
            SliverVisibility(
              visible: acountControll.visibaleGrid,
              sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  delegate: SliverChildListDelegate([
                    Align(
                      alignment: Alignment.topCenter,
                      child: DafultInformationOneClomun(
                        onTap: () => acountControll.changedSelectedStoe(0),
                        titel: AppText.store.tr,
                        iconName: AppImageName.profile,
                        isSlected: acountControll.indexSelectedStore == 0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: DafultInformationOneClomun(
                        onTap: () {
                          //  print("kk")
                          // ;

                          acountControll.changedSelectedStoe(1);
                        },
                        titel: AppText.additionLists.tr,
                        iconName: AppImageName.additionLists,
                        isSlected: acountControll.indexSelectedStore == 1,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: DafultInformationOneClomun(
                        titel: AppText.withdrawalLists.tr,
                        onTap: () {
                          acountControll.changedSelectedStoe(2);
                        },
                        iconName: AppImageName.withdrawalLists,
                        isSlected: acountControll.indexSelectedStore == 2,
                      ),
                    ),
                  ])),
            ),
            SliverMainAxisGroup(slivers: [
              acountControll.indexSelectedStore == 0
                  ? SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      sliver: SliverToBoxAdapter(
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Ietm(
                                heightOfShadowLeft: 350,
                                wdith: Mathed.ResponcvMax(
                                    MediaQuery.sizeOf(context).width * 0.9,
                                    400),
                                Item: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    spacing: 15,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      itemInformationStore(
                                        Subtitel: '5151155',
                                        titel: "السعر الكلي قبل الخصم: ",
                                      ),
                                      itemInformationStore(
                                        isTextField: true,
                                        Subtitel: '5151155',
                                        titel: "خصم النسبة المئوية : ",
                                      ),
                                      itemInformationStore(
                                        Subtitel: '5151155',
                                        titel: "                              ",
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 1.2,
                                      ),
                                      itemInformationStore(
                                        Subtitel: '5151155',
                                        titel: "محموع النقد بالدولار: ",
                                      ),
                                      itemInformationStore(
                                        isTextField: true,
                                        isRemov: false,
                                        Subtitel: '5151155',
                                        titel: " السعر بالريال السعودي : ",
                                      ),
                                      itemInformationStore(
                                        Subtitel: '5151155',
                                        titel:
                                            "                               ",
                                      ),
                                      itemInformationStore(
                                          Subtitel: '5151155',
                                          titel: "مجموع النقاط:"),
                                    ],
                                  ),
                                ),
                              ))),
                    )
                  : SliverToBoxAdapter(),
              ListStore(),
            ])
          ]);
        });
  }
}

class itemInformationStore extends StatelessWidget {
  const itemInformationStore({
    super.key,
    required this.titel,
    required this.Subtitel,
    this.isTextField = false,
    this.isRemov = true,
  });
  final String titel;
  final String Subtitel;
  final bool isTextField;
  final bool isRemov;

  @override
  Widget build(BuildContext context) {
    final AcountControll acountControll = Get.find();
    return Expanded(
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Flexible(
            flex: 2,
            child: FittedBox(
              child: Text(
                titel,
                style: ApptextStyle.textStyleApp16,
              ),
            ),
          ),
          !isTextField
              ? Flexible(
                  child: FittedBox(
                    child: Text(
                      Subtitel,
                      style: ApptextStyle.textStyleApp16,
                    ),
                  ),
                )
              : Flexible(
                  flex: 1,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          isRemov
                              ? acountControll.boxPrice.put(
                                  HivenServices.pricewithRemove,
                                  int.tryParse(value) ?? 5)
                              : acountControll.boxPrice.put(HivenServices.price,
                                  int.tryParse(value) ?? 150);
                        },
                        onChanged: (value) {
                          isRemov
                              ? acountControll.boxPrice.put(
                                  HivenServices.pricewithRemove,
                                  int.tryParse(value) ?? 5)
                              : acountControll.boxPrice.put(HivenServices.price,
                                  int.tryParse(value) ?? 150);
                        },
                        controller: isRemov
                            ? acountControll.textTotelPricewithRemove
                            : acountControll.textTotelPrice,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        ),
                      ))),
        ],
      ),
    );
  }
}

class ListStore extends StatelessWidget {
  const ListStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AcountControll acountControll = Get.find();
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        sliver: SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemBuilder: (context, index) {
              return Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      acountControll.indexSelectedStore != 0
                          ? acountControll.setVisibale(false)
                          : null;

                      // custmorGridControll.changedIndexCustmor(1);
                    },
                    child: Ietm(
                      heightOfShadowLeft: 325,
                      wdith: Mathed.ResponcvMax(
                          MediaQuery.sizeOf(context).width * 0.9, 400),
                      Item: Padding(
                        padding: const EdgeInsets.all(30),
                        child: DafultListInformation(
                            titel: acountControll.indexSelectedStore == 0 ||
                                    !acountControll.visibaleGrid
                                ? modulesProduct
                                : moduleTitelStroe,
                            iconName: acountControll.indexSelectedStore == 0
                                ? modulesProductNameIcon
                                : moduleIconNameStroe),
                      ),
                    ),
                  ));
            }));
  }
}
