import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';

class DafultOrderInformation extends StatelessWidget {
  const DafultOrderInformation({super.key});

  @override
  Widget build(BuildContext context) {
    //final Ordercontroll ordercontroll = Get.find();
    return SliverToBoxAdapter(
      child: IntrinsicHeight(
        child: Column(
          spacing: 20,
          children: [
            Flexible(
              flex: 1,
              child: Detales(
                title: AppText.order.tr,
                icontitle: AppImageName.order,
                DetalesList: orderInformation,
              ),
            ),
            Flexible(
              flex: 1,
              child: Detales(
                title: AppText.customer.tr,
                icontitle: AppImageName.custmor,
                DetalesList: custmorInformation,
              ),
            ),
            SizedBox(
              height: 180,
              child: Detales(
                title: AppText.area.tr,
                icontitle: AppImageName.area,
                DetalesList: areaInformation,
              ),
            ),
            SizedBox(
              height: 200,
              child: Detales(
                title: AppText.payment.tr,
                icontitle: AppImageName.totalAmount,
                DetalesList: payesInformation,
              ),
            ),
            SizedBox(
              height: 100,
              child: Detales(
                title: AppText.satuts.tr,
                icontitle: AppImageName.stauts,
                DetalesList: stautsInformation,
              ),
            ),
            SizedBox(
              height: 150,
              child: Detales(
                title: AppText.date.tr,
                icontitle: AppImageName.date,
                DetalesList: dateInformation,
              ),
            ),
            SizedBox(
              height: 150,
              child: Detales(
                title: AppText.delegate.tr,
                icontitle: AppImageName.profile,
                DetalesList: delegateInformationc,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Column(
                    spacing: 10,
                    children: [
                      DadfultBoutton(
                          title: AppText.printing.tr,
                          ColorSelected: Colors.white,
                          fillColor: AppColor.Catrgray,
                          icon: null),
                      DadfultBoutton(
                          title: AppText.responses.tr,
                          ColorSelected: AppColor.Catrgray,
                          fillColor: Colors.white,
                          icon: null),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class Detales extends StatelessWidget {
  const Detales({
    super.key,
    required this.title,
    required this.icontitle,
    required this.DetalesList,
  });
  final String title;
  final String icontitle;
  final List<String> DetalesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                icontitle,
                height: 25,
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                title,
                style: ApptextStyle.textStyleApp16,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 3,
            color: Color.fromRGBO(202, 196, 208, 1),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(DetalesList.length, (index) {
                  return Flexible(
                    child: FittedBox(
                      child: Text(DetalesList[index],
                          style: ApptextStyle.textStyleApp16),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
