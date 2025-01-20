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
import 'package:ican/featuers/home/Presentation/models/OrderDatiles.dart';

class DafultOrderInformation extends StatelessWidget {
  const DafultOrderInformation({super.key, required this.orderDatiles});
  final OrderDatiles orderDatiles;

  @override
  Widget build(BuildContext context) {
    //final Ordercontroll ordercontroll = Get.find();
    return SliverToBoxAdapter(
      child: Column(
        spacing: 20,
        children: [
          Detales(
            title: AppText.order.tr,
            icontitle: AppImageName.order,
            DetalesList: orderInformation(orderDatiles),
          ),
          Detales(
            title: AppText.customer.tr,
            icontitle: AppImageName.custmor,
            DetalesList: custmorInformation(orderDatiles),
          ),
          Detales(
            title: AppText.area.tr,
            icontitle: AppImageName.area,
            DetalesList: areaInformation(orderDatiles),
          ),
          Detales(
            title: AppText.payment.tr,
            icontitle: AppImageName.totalAmount,
            DetalesList: payesInformation(orderDatiles),
          ),
          Detales(
            title: AppText.satuts.tr,
            icontitle: AppImageName.stauts,
            DetalesList: stautsInformation(orderDatiles),
          ),
          Detales(
            title: AppText.date.tr,
            icontitle: AppImageName.date,
            DetalesList: dateInformation(orderDatiles),
          ),
          // Detales(
          //   title: AppText.delegate.tr,
          //   icontitle: AppImageName.profile,
          //   DetalesList: delegateInformationc,
          // ),
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
                        onTap: () {},
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(DetalesList.length, (index) {
                return Text(DetalesList[index],
                    style: ApptextStyle.textStyleApp16);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
