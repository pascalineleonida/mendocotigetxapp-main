import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/service/controller/controller.dart';
import 'package:mendocoti_appmobile_flutter/service/language/localtext.dart';
import 'package:mendocoti_appmobile_flutter/view/Authentification/loginpage.dart';
import 'package:mendocoti_appmobile_flutter/view/splashscreen.dart';
import 'package:mendocoti_appmobile_flutter/view/testcomponent/firstco;ponent.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'component/style/color.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {

        return GetMaterialApp(
          translations: Localstring(),
          locale: Get.deviceLocale,
          title: 'Mendo-coti',
          builder: EasyLoading.init(),

          debugShowCheckedModeBanner: false,

         enableLog: true,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorApp.primary),
            useMaterial3: true,

          ),
          home: SplashScreen(),
        ); 
      },
    );
  }
}


