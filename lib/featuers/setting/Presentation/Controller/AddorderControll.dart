import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/services/permationFile.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Data/Remote/RemtoProdacte.dart';
import 'package:ican/featuers/setting/Presentation/Controller/StateLaederControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:ican/featuers/setting/Presentation/Models/prodect.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfProdect.dart';
import 'package:file_picker/file_picker.dart';

class AddOrderControll extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
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

  late Animation<double> animation;
  late Animation<double> animationProdect;
  late Animation<double> opacity;
  late Animation<double> opacityProdect;
  late Animation<Offset> position;
  late Animation<Offset> positionProdect;
  late Mainlayoutcontroll mainlayoutcontroll;
  late List<ProdectModels> prodectData;
  late bool lodingProdect;
  Timer? t;

  @override
  void onInit() {
    initText();
    t = null;
    prodectData = [
      ProdectModels(id: 1, name: "ffafeff", price: 12000),
      ProdectModels(id: 1, name: "ffafeff", price: 12000),
      ProdectModels(id: 1, name: "ffafeff", price: 12000),
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
  }

  Future<void> CloseDropOfProdect() async {
    mainlayoutcontroll.changedCanGoToPages(true);

    animationControllerprodect.reverse();
    await Future.delayed(const Duration(milliseconds: 400));

    overlayEntryProdect?.remove();
    overlayEntryProdect = null;
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
}
