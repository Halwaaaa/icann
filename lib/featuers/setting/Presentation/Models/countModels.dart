import 'dart:io';

import 'package:dio/dio.dart';

class Countmodels {
  final int id;
  int qty;

  Countmodels({
    required this.id,
    required this.qty,
  });

  // تحويل الموديل إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'qty': qty,
    };
  }

  // تحويل Map إلى موديل
  factory Countmodels.fromMap(Map<String, dynamic> map) {
    return Countmodels(
      id: map['id'],
      qty: map['qty'],
    );
  }
}

class OrderAddModel {
  final dynamic clientName;
  final dynamic clientPhone;
  final dynamic clientPhoneTwo;
  final dynamic clientWhatsapp;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? address;
  final double? totalAmount;
  final String? paymentType;
  final String? note;
  final File? payment_image;
  final List<Countmodels>? products;

  OrderAddModel({
    required this.clientName,
    required this.clientPhone,
    required this.clientPhoneTwo,
    required this.clientWhatsapp,
    required this.countryId,
    required this.stateId,
    required this.payment_image,
    this.cityId,
    required this.address,
    required this.totalAmount,
    required this.paymentType,
    required this.note,
    required this.products,
  });

  // تحويل الموديل إلى Map
  Future<Map<String, dynamic>> toMap() async {
    return {
      'client_name': clientName,
      'client_phone': clientPhone,
      'client_phone_two': clientPhoneTwo,
      'client_whatsapp': clientWhatsapp,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'address': address,
      'total_amount': totalAmount,
      'payment_type': paymentType,
      'note': note,
      'products': products?.map((product) => product.toMap()).toList(),
    };
  }

  Future<FormData> sendData() async {
    Map<String, dynamic> dataMap = await toMap();

    FormData formData = FormData.fromMap(dataMap);

    if (payment_image != null) {
      formData.files.add(MapEntry(
        'payment_image',
        await MultipartFile.fromFile(payment_image!.path),
      ));
    }
    return formData;
  }

  // تحويل Map إلى موديل
  factory OrderAddModel.fromMap(Map<String, dynamic> map) {
    return OrderAddModel(
      payment_image: map['payment_image'],
      clientName: map['client_name'],
      clientPhone: map['client_phone'],
      clientPhoneTwo: map['client_phone_two'],
      clientWhatsapp: map['client_whatsapp'],
      countryId: map['country_id'],
      stateId: map['state_id'],
      cityId: map['city_id'],
      address: map['address'],
      totalAmount: map['total_amount'],
      paymentType: map['payment_type'],
      note: map['note'],
      products: List<Countmodels>.from(
        map['products'].map((product) => Countmodels.fromMap(product)),
      ),
    );
  }
}
