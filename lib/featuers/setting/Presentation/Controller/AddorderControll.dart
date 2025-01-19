import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:ican/core/services/permationFile.dart';
import 'package:ican/featuers/setting/Data/Remote/RemoteAddOrder.dart';
import 'package:ican/featuers/setting/Presentation/Models/countModels.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Data/Remote/RemtoProdacte.dart';
import 'package:ican/featuers/setting/Presentation/Controller/StateLaederControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:ican/featuers/setting/Presentation/Models/prodect.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfProdect.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class AddOrderControll extends GetxController with GetTickerProviderStateMixin {
  static String prodect = 'prodect';

  late AnimationController animationController;
  late TextEditingController searchController;

  late File? image;
  late bool haveImge;
  late bool haveFile;
  late bool hasinit;
  late File? FileStorge;
  late AnimationController animationControllerprodect;
  late TextEditingController textNamEmployee;
  late TextEditingController textNamClient;
  late TextEditingController textNaumberClient;
  late TextEditingController textNaumber2Client;
  late TextEditingController textNaumberWhatAppClient;
  late TextEditingController textAddresClient;
  late TextEditingController texttotalAmount;
  late TextEditingController textNotes;
  late CountersLaederControll countersLaederControll;
  late StateLaederControll stateLaederControll;
  OverlayEntry? overlayEntryProdect;
  late bool isDropdownVisibleProdect;
  late num totalPricrOrder;

  late Animation<double> animation;
  late Animation<double> animationProdect;
  late Animation<double> opacity;
  late Animation<double> opacityProdect;
  late Animation<Offset> position;
  late Animation<Offset> positionProdect;
  late Mainlayoutcontroll mainlayoutcontroll;
  late List<ProdectModels> prodectData;
  late List<int> prodectSerchId;
  late List<Countmodels> prodectcount;
  late List<Countmodels> prodectcountSelected;
  late bool lodingProdect;
  Timer? t;

  @override
  void onInit() {
    initText();
    FileStorge = null;
    t = null;
    prodectcountSelected = [];
    totalPricrOrder = 0;

    prodectData = [
      ProdectModels(id: 1, name: "ffafeff", price: 12000, count: 0),
      ProdectModels(id: 1, name: "ffafeff", price: 12000, count: 0),
      ProdectModels(id: 1, name: "ffafeff", price: 12000, count: 0),
    ];
    prodectSerchId = [];
    prodectcount = [
      Countmodels(id: 0, qty: 0),
      Countmodels(id: 0, qty: 0),
      Countmodels(id: 0, qty: 0),
    ];
    getProdect();
    isDropdownVisibleProdect = false;

    initAnimated();
    // TODO: implement onInit
    mainlayoutcontroll = Get.find();
    super.onInit();
  }

  @override
  void onClose() {
    t?.cancel();
    animationController.dispose();
    disposeText();
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    countersLaederControll = Get.find();
    stateLaederControll = Get.find();
    countersLaederControll.init();
    stateLaederControll.init();
    // TODO: implement onReady
    super.onReady();
  }

  void initAnimated() {
    animationController = AnimationController(
      vsync: this, // GetSingleTickerProviderStateMixin يوفر `vsync`
      duration: const Duration(milliseconds: 400),
    );
    animationControllerprodect = AnimationController(
      vsync: this, // GetSingleTickerProviderStateMixin يوفر `vsync`
      duration: const Duration(milliseconds: 400),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    animationProdect = CurvedAnimation(
      parent: animationControllerprodect,
      curve: Curves.linear,
    );

    opacity = Tween<double>(begin: 0, end: 1).animate(animation);
    opacityProdect = Tween<double>(begin: 0, end: 1).animate(animationProdect);
    position =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0, 0))
            .animate(animation);
    positionProdect =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0, 0))
            .animate(animationProdect);
  }

  void disposeText() {
    textNamEmployee.dispose();
    textNamClient.dispose();
    textNaumberClient.dispose();
    textNaumber2Client.dispose();
    textNaumberWhatAppClient.dispose();
    textAddresClient.dispose();
    texttotalAmount.dispose();
    textNotes.dispose();
    searchController.dispose();
  }

  void initText() {
    textNamEmployee = TextEditingController();
    textNamClient = TextEditingController();
    textNaumberClient = TextEditingController();
    textNaumber2Client = TextEditingController();
    textNaumberWhatAppClient = TextEditingController();
    textAddresClient = TextEditingController();
    texttotalAmount = TextEditingController();
    textNotes = TextEditingController();
    searchController = TextEditingController();
  }

  Future<void> CloseDropOfProdect() async {
    mainlayoutcontroll.changedCanGoToPages(true);

    animationControllerprodect.reverse();
    await Future.delayed(const Duration(milliseconds: 400));

    overlayEntryProdect?.remove();
    overlayEntryProdect = null;
  }

  void addProdect(int index) {
    if (prodectcount[index].qty < prodectData[index].count &&
        prodectData[index].count != 0) {
      prodectcount[index].qty = prodectcount[index].qty + 1;

      totalPricrOrder = totalPricrOrder + prodectData[index].price;
      prodectcountSelected.add(Countmodels(
          id: prodectcount[index].id, qty: prodectcount[index].qty));
      update([prodect]);
    }
  }

  void removeProdect(int index) {
    if (prodectcount[index].qty != 0) {
      prodectcount[index].qty = prodectcount[index].qty - 1;
      removprodrct(index);
      update([prodect]);
    }
  }

  void removprodrct(int index) {
    if (prodectcount[index].qty != 0) {
      totalPricrOrder = totalPricrOrder - prodectData[index].price;

      prodectcountSelected.add(Countmodels(
          id: prodectcount[index].id, qty: prodectcount[index].qty));
    } else {
      totalPricrOrder = totalPricrOrder - prodectData[index].price;

      prodectcountSelected
          .removeWhere((element) => element.id == prodectcount[index].id);
    }
  }

  void searchProdect(String search) {
    print(search);
    prodectSerchId = [];
    prodectData.forEachIndexed(
      (index, element) {
        if (element.name.toLowerCase().contains(search.toLowerCase())) {
          prodectSerchId.add(element.id);
        }
      },
    );

    update([prodect]);
  }

  void openDropOfProdrct(
    BuildContext context,
  ) {
    overlayEntryProdect = showDropdownOfProdect(
      context,
    );
    mainlayoutcontroll.jumbTo();
    mainlayoutcontroll.changedCanGoToPages(false);
    Overlay.of(context).insert(overlayEntryProdect!);
    animationControllerprodect.reset();
    animationControllerprodect.forward();
  }

  static String ProdectGet = 'ProdectGet';
  Future<void> getProdect() async {
    lodingProdect = true;
    update([ProdectGet]);
    final ServicesDio servicesDio = Get.find();
    RemtoProdacte remtoProdacte = RemtoProdacte(servicesDio);
    List<ProdectModels>? result = await remtoProdacte.getPordacte();
    if (result != null) {
      lodingProdect = false;
      prodectData = result;
      prodectcount = List.generate(
        result.length,
        (index) {
          return Countmodels(id: result[index].id, qty: 0);
        },
      );

      update([ProdectGet]);
    } else {
      Get.snackbar(
        "خطا",
        "الرجاء التحقق من الاتصال",
        //backgroundColor: Colors.black,
        colorText: Colors.black,
        duration: const Duration(seconds: 5),
      );
      t = Timer.periodic(const Duration(seconds: 10), (time) async {
        List<ProdectModels>? result = await remtoProdacte.getPordacte();
        if (result != null) {
          Get.snackbar(
            " ",
            "تم اعادة الاتصال",
            colorText: Colors.black,
            duration: const Duration(seconds: 5),
          );
          lodingProdect = false;
          prodectData = result;
          update([ProdectGet]);
          time.cancel();
        }
      });
    }
  }

  Future<void> saveImge() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      //  haveImge = true;
    }
    update();
  }

  void Delete() {
    FileStorge = null;
    // FileController.text = '';
    haveFile = false;
    update();
  }

  void GetFileStorge(BuildContext context) {
    PermsionFilesServers.requestStoragePermission().then((value) async {
      await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      ).then((value) async {
        await SaveFile(value);
      }).catchError((eroo) {});
    }).catchError(((Error) {
      if (Error is PermissionStatuspermanentlyDenied) {
        AwesomeDialog(
          context: context,
          title: Error.message,

          // btnOkColor: Config().PrimerColor,

          // btnOkOnPress: () {
          //   openAppSettings();
          // }
        ).show();
      }
    }));
  }

  Future<void> SaveFile(FilePickerResult? value) async {
    if (value != null && value.files.single.path != null) {
      final filePath = value.files.single.path!;
      FileStorge = File(filePath);
      //  FileController.text = value.files.single.name;
      haveFile = true;
      update();
    }
  }

  Future<void> addOrder(BuildContext context) async {
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    Mainlayoutcontroll mainlayoutcontroll = Get.find();
    mainlayoutcontroll.changedLoding(true);

    ServicesDio servicesDio = Get.find();
    RemoteAddOrder remoteAddOrder = RemoteAddOrder(servicesDio);

    OrderAddModel orderAddModel = OrderAddModel(
        payment_image: null,
        clientName: textNamClient.text,
        clientPhone: int.tryParse(textNaumberClient.text),
        clientPhoneTwo: int.tryParse(textNaumber2Client.text),
        clientWhatsapp: int.tryParse(textNaumberWhatAppClient.text),
        countryId: countersLaederControll.indexCountre,
        stateId: stateLaederControll.idStates,
        address: textAddresClient.text,
        totalAmount: double.tryParse(texttotalAmount.text),
        paymentType: countersLaederControll.selectedStatues[0] == true
            ? 'cc'
            : countersLaederControll.selectedStatues[1] == true
                ? 'cod'
                : null,
        note: '',
        products: prodectcountSelected);
    print(orderAddModel);
    await remoteAddOrder.addOrder(orderAddModel, context).then((f) {
      //  mainlayoutcontroll.changedLoding(false);
    });
  }
}
