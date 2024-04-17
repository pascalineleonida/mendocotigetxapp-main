import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../appconfig/constant.dart';
import '../model/profilusermodel.dart';
import '../model/usermodel.dart';
import '../model/usermodeldata.dart';
import '../service/controller/controller.dart';
import 'Authentification/loginpage.dart';
import 'home/homepage.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserModeldata.getusers();
    Profiluser.getusers();

    Controller c = Get.put(Controller());

  }


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Constants.logoapps,
      nextScreen: Login(),

    );
  }
}
