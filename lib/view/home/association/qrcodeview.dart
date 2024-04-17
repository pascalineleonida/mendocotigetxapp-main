import 'dart:async';

import 'dart:io';
import 'dart:typed_data';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../component/style/color.dart';
import '../../../component/widget/text_ibm_plex_sans.dart';
import '../../../model/associationmodel.dart';

class QrCodePage extends StatefulWidget {
  final Items association;

  const QrCodePage({super.key, required this.association});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  // final int _counter = 0;
  // late Uint8List _imageFile;

  ScreenshotController screenshotController = ScreenshotController();
  List help = [
    "1. Rendez-vous dans la section « structures »",
    "2. Cliquez sur le « Adhérer à une structure » et cliquez sur l’icône du QR code.",
    "3. Positionnez votre téléphone pour que l'appareil photo puisse voir clairement le QR code que vous souhaitez scanner. Assurez-vous d'être à une distance appropriée pour que le code QR puisse être capturé clairement.",
    "4. Maintenant, dirigez l'objectif de l'appareil photo de votre téléphone vers le QR code. L'application scanner QR code détectera automatiquement le code QR et le scannera.",
    "5. Une fois que le QR code est scanné avec succès, l'application vous présentera les informations associées à la structure en question et vous proposera d’y adhérer.",
    "6. Cliquez sur le bouton « adhérer » et patientez que l’administrateur valide votre demande.",
  ];
  bool screen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: ListView(
        children: [
          widgetcapture(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              IconButton(
                  onPressed: () async {
                    final image = await screenshotController.capture();
                    if (image == null) return;

                    await SaveImage(image);
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text("savepicture".tr),
                      backgroundColor: Colors.green,
                    ));
                  },
                  icon: Icon(Icons.download_outlined)),
              IconButton(
                  onPressed: () async {
                    final image = await screenshotController.capture();
                    if (image == null) return;

                    await saveandshare(image);

                  },
                  icon: Icon(Icons.share)),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  color: ColorApp.background,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          color: ColorApp.primary,
                          onPressed: () {},
                          icon: const Icon(Icons.help),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: IBMPlexSans(
                          text: 'Comment scanner le code ?',
                          color: Color(0xff676767),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: help.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IBMPlexSans(
                              text: e.toString(),
                              color: ColorApp.textColor2,
                              size: 14.sp,
                              maxLines: 7,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.start,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Votre capture d'ecran"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.memory(capturedImage),
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () async {
                  // final result = await Share.shareWithResult('check out my website https:example.com');
                  // if (result.status == ShareResultStatus.success) {
                  //   print('Thank you for sharing my website!');
                  // }
                },
                icon: const Icon(
                  Icons.share_sharp,
                  size: 20,
                  color: ColorApp.primary,
                ))
          ],
        ),
      ),
    );
  }

  widgetcapture() {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 2.h),

        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: ColorApp.primary,
                radius: 40,
                child: ClipPath(
                  clipper: const ShapeBorderClipper(shape: StadiumBorder()),
                  child: Image.asset(
                    "assets/images/Icogroup1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            IBMPlexSans(
              text: widget.association.name.toString(),
              color: ColorApp.textColor,
              fontWeight: FontWeight.w700,
              size: 28,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: QrImageView(
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: ColorApp.primary,
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: ColorApp.primary,
                ),
                data: widget.association.code.toString(),
                version: QrVersions.auto,
                size: 200,
              ),
            ),
            SizedBox(height: 1.h,),

            IBMPlexSans(text: widget.association.code.toString(),fontWeight: FontWeight.bold,),
            SizedBox(height: 1.h,),
            Container(

              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ExpandableText(
                widget.association.description != null
                    ? widget.association.description.toString()
                    : "",
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                animation: true,
                expandText: "voir".tr,
                expanded: true,
                // collapseText: "masque".tr,
                animationDuration: Duration(seconds: 2),
                maxLines: 2,
                linkColor: ColorApp.primary,

              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> SaveImage(Uint8List image) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');

    final name = "screenshot_$time";
    final  result = await ImageGallerySaver.saveImage(image,name: name);
    return result['filePath'];
  }

  Future saveandshare(Uint8List bytes)async{
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final image = File("${appDocumentsDir.path}/mendocoti.png");
    image.writeAsBytesSync(bytes);
    final text = "Share from Mendo coti ";
await Share.shareFiles([image.path],text: text,);

  }


}
