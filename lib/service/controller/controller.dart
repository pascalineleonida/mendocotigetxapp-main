import 'dart:async';
import 'dart:io';

import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/bouton_custom.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appconfig/constant.dart';
import '../../component/style/color.dart';
import '../../component/widget/text_ibm_plex_sans.dart';
import '../../model/associationmodel.dart';
import '../../model/lasttransactionmodel.dart';
import '../../model/profilusermodel.dart';
import '../../model/projetmodel.dart';
import '../../model/structuremodel.dart';
import '../../model/transactionpaymodel.dart';
import '../../model/usermodel.dart';
import '../../model/usermodeldata.dart';
import '../../util/helpers/g.dart';
import '../callapi/authentification/authentifaction.dart';
import '../callapi/structure/structureapicall.dart';
import '../connection/connectionchecker.dart';

class Controller extends GetxController{
  var count = 0.obs;
  late RxBool permission;
  RxString locale =  "fr".substring(0,1).obs;
  var indexed = 0;

  bool startanimation = false;
  RxBool result = false.obs;
  RxBool isAlertSet = false.obs;
  RxBool isDeviceConnected = false.obs;
  late StreamSubscription subscription ;



  var checkif_isfirstopenapp ;
  List Viewcard = ["assets/images/BGVert.png", "assets/images/BGViolet.png"];
  List pubforbuttonpage = [
    "assets/images/Pub2.png",
    "assets/images/pub.jpg",
    "assets/images/Pub3.png"
  ];
  RxList<StructureModel> checkstructure =<StructureModel>[].obs;
  RxList<Profiluser> profiluser = <Profiluser>[].obs;
  RxList<Transactionpaymodel> transactions = <Transactionpaymodel>[].obs;

  List<File> allimage = <File>[].obs;
  List<Profiluser> infocontact = <Profiluser>[].obs;
  RxList<Associationmodel>associationdata = <Associationmodel>[].obs;
  RxList<Lasttransactionmodel>lasttransaction = <Lasttransactionmodel>[].obs;
  RxList<Projetmodels> projetdata = <Projetmodels>[].obs;

 // var fullname = "${UserModel.sessionusers!.profil!.name.toString()} ${UserModel.sessionusers!.profil!.name.toString()}";

  PageController scrool = PageController(initialPage: 0);
  final caroussel = CarouselController();
  final picker = ImagePicker();
  File? image;
  var langues = Get.deviceLocale.obs;


  increment() => count++;
  increments(index) => {
    indexed = index,
    print(indexed)
  };


  checkprojetbycategory(idcategorie) async {
    var data = await StructureAPIcall.getprojetbycategorie(idcategorie);
    // print(data);
    if (data != null) {


      for (Map<String, dynamic> datas in data) {
          projetdata.add(Projetmodels.fromJson(datas));
          update();
      }
      print(projetdata.length);
    }
  }



  getdata(id) async {
    var data = await StructureAPIcall.checktransaction(id);
    print(data);
    if (data != null) {
        transactions.clear;
        transactions.add(Transactionpaymodel.fromJson(data));
        update(transactions);
      print(transactions.length);
      print("_transactions.length");
    }
  }



  getusers(code) async {
    var data = await Authentification.getuser(code);
    // print(data);
    if (data != null) {
      infocontact.clear();

      infocontact.add(Profiluser.fromJson(data));
      update(
              infocontact
          );

      print(infocontact.length);
      return data;
    }
  }

  checkpermission()async{
    var status = await Permission.camera.status;
    if(status.isDenied){
      permission = false.obs;
    }else{
      permission = true.obs;
    }


    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example, because of parental controls.
    }


  }







  getfirstopen() async {
    SharedPreferences first = await SharedPreferences.getInstance();
    first.setInt("first", 1);
    checkif_isfirstopenapp = first.get("first");
  }
  getfirst() async {

    startanimation = true;
    print(startanimation);
    SharedPreferences first = await SharedPreferences.getInstance();
    checkif_isfirstopenapp = first.get("first");
    if (checkif_isfirstopenapp == null) {
      first.setInt("first", 1);
    }else{
      count++;
      print("count");
      print(count);
    }
  }
  Future chooseImageCamera() async {
    var pickerImage = await picker.pickImage(source: ImageSource.camera);
    if (pickerImage == null) {
      return;
    } else {
      image = File(pickerImage.path);
      allimage.clear();
        allimage.add(image!);
update();
      Authentification.updatepicture();
     Get.back();


    }
  }
  Future chooseImageGallery() async {
    var pickerImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickerImage == null) {
      return;
    } else {
      allimage.clear();
      image = File(pickerImage.path);
        allimage.add(image!);
update();
     Get.back();
      Authentification.updatepicture();

    }
  }

  modalselectsource(){
    Get.bottomSheet(

          enableDrag: true,
          isDismissible: true,
            isScrollControlled: true,

            exitBottomSheetDuration: Duration(milliseconds: 400),
            elevation: 25,
            Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 22),
                      const IBMPlexSans(
                        text: "Modifier la photo de profil",
                        color: Color(0xff433A2C),
                        fontWeight: FontWeight.w600,
                      ),

                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: Boutoncustom(
                                  text: const IBMPlexSans(
                                    text: 'Appareil photo',
                                    color: ColorApp.onPrimary,
                                    fontWeight: FontWeight.bold,
                                    size: 16,
                                  ),
                                  color: ColorApp.primary,
                                  onPressed: () {  chooseImageCamera();
                                  },
                                  padding: 3,
                                  size: 10))),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                            height: 55,
                            width: double.infinity,
                            child: Boutoncustom(
                              text: const IBMPlexSans(
                                text: 'Importer depuis la galerie',
                                color: ColorApp.primary,
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                              color: ColorApp.onPrimary,
                              onPressed: () {
                                chooseImageGallery();
                              },
                              padding: 3,
                              size: 10,

                            )),
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                    ],
                  )
                ],
              ),
            )
        );
  }


  showDialogBoxerror(context) => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title:  Text('timeout'.tr),
      content:  Text('timeoutsms'.tr),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');

          },
          child: const Text('OK'),
        ),
      ],
    ),
  );






  modalDelete(context) => showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                  color: ColorApp.onBackground,
                )),
          ),
          SvgPicture.asset(
            'assets/svg/deleteimage.svg',
            height: 226,
            width: 216,
          ),
          IBMPlexSans(
            text: "quit".tr,
            fontWeight: FontWeight.bold,
            size: 20,
            color: ColorApp.onBackground,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(

            child: Column(
              children: [
                IBMPlexSans(
                  text: "dearuser".tr,
                  color: ColorApp.onBackground,
                  fontWeight: FontWeight.w400,
                  size: 10,maxLines: 8,
                ),
                const SizedBox(
                  height: 18,
                ),
                IBMPlexSans(
                  text: "deletecomptetext1".tr,
                  color: ColorApp.onBackground,
                  fontWeight: FontWeight.w400,
                  size: 10,
                  maxLines: 6,
                ),
                const SizedBox(
                  height: 10,
                ),
                IBMPlexSans(
                  text: "deletecomptetext2".tr,
                  color: ColorApp.onBackground,
                  fontWeight: FontWeight.w400,
                  size: 10,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                IBMPlexSans(
                  text: "deletecomptetext3".tr,
                  color: ColorApp.onBackground,
                  fontWeight: FontWeight.w400,
                  size: 10,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                IBMPlexSans(
                  text: "deletecomptetext4".tr,
                  color: ColorApp.onBackground,
                  fontWeight: FontWeight.w400,
                  size: 10,
                  maxLines: 5,
                ),
                IBMPlexSans(
                  text: "deletecomptetext5".tr,
                  color: ColorApp.onBackground,
                  fontWeight: FontWeight.w500,
                  size: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 23),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.delete,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  G.launchBroswer(
                      uri:
                      'https://coti.mendo.cm/account/delete/${UserModeldata.sessionusers!.authKey.toString()}/${UserModeldata.sessionusers!.token.toString()}');
                },
                child: IBMPlexSans(
                  text: "deleteAccountdefinitif".tr,
                  textAlign: TextAlign.center,
                  color: ColorApp.onPrimary,
                  fontWeight: FontWeight.w400,
                  // decoration: TextDecoration.underline,
                  size: 14,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ));






  checfirstpage(){
    checkuser();
    checkstructures();
    checklasttransaction();

  }

  checkuser()async{
    var data  =  await Authentification.getinfouser();
    if(data!= null){
      profiluser.clear();
        profiluser.add(Profiluser.fromJson(data));
      print( "profiluser.length");
      print( profiluser.length);
      print( profiluser.first.name.toString());
      print( "profiluser.length");
      update();

    }
  }
  checkstructures()async{
    var data  =  await StructureAPIcall.checkStructure();
    if(data!= null){
      associationdata.clear();
      count++;
        associationdata.add(Associationmodel.fromJson(data));
      print( profiluser.length);
      update();
    }
  }
  checklasttransaction()async{
    var data  =  await StructureAPIcall.checklastransaction();
    if(data!= null){
      lasttransaction.clear();
        lasttransaction.add(Lasttransactionmodel.fromJson(data));
      update();

      print( lasttransaction.length);
      print( lasttransaction.first.items!.first.member!.name.toString());
    }
  }


}