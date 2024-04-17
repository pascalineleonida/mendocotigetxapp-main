import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../appconfig/constant.dart';
import '../../../component/style/color.dart';
import '../../../service/controller/controller.dart';

class Dashbordview extends StatefulWidget {
  const Dashbordview({super.key});

  @override
  State<Dashbordview> createState() => _DashbordviewState();
}

class _DashbordviewState extends State<Dashbordview> {
  Controller c = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: SingleChildScrollView(child: Column(

          children: [

         Align(child:  headsection(),),
         Align(child:  bodysection(),),
         Align(child:  footersection(),),
        ],),),
      ),
    );
  }

  headsection() {
    return Container(

      padding: EdgeInsets.only(left: 1.w, right: 1.w, top: 1.h),
      child: Column(

       children: [
          Column(

            children: [
              SizedBox(
                width: 358,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'messagepub'.tr,
                        style: const TextStyle(
                          color: Color(0xFF3B362E),
                          fontSize: 20,
                          fontFamily: 'IBM Plex Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const TextSpan(
                        text: " ${Constants.appname}",
                        style: TextStyle(
                          color: Color(0xFFEFA83D),
                          fontSize: 20,
                          fontFamily: 'IBM Plex Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  bodysection() {
    return SizedBox(
      height: 65.h,
      child: SizedBox(
        width: double.infinity,
        child: PageView.builder(
            controller: c.scrool,
            itemCount: c.Viewcard.length,
            itemBuilder: (context, index) {
              final post = c.Viewcard[index];
              return Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(post),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(7, 12),
                        blurRadius: 4,
                        color: Color(0x6B676767),
                      )
                    ]),
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorApp.onPrimary,
                            radius: 12,
                            child: Image.asset(
                              "assets/images/Tirelire.png",
                              fit: BoxFit.cover,
                              height: 15,
                            ),
                          ),
                          IBMPlexSans(
                              text: "${"astuce".tr}${index + 1}",
                              size: 15,
                              color: const Color(0xffFFFFFF))
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      IBMPlexSans(
                          text: "epargnslogantext".tr,
                          fontWeight: FontWeight.w600,
                          size: 20.sp,
                          color: ColorApp.onPrimary),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 32.h,
                            width: 100.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/illustration.png"))),
                            child: c.count == 0
                                ? Align(
                              alignment: Alignment.topRight,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: SizedBox(
                                    height: 100,
                                    child: Lottie.asset(
                                      alignment: const Alignment(10, 50),
                                      reverse: true,
                                      'assets/lottie/Swipeanimation.json',
                                    )),
                              ),
                            )
                                : const SizedBox(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  footersection() {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 109.px,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                        carouselController: c.caroussel,
                        items: c.pubforbuttonpage
                            .map((e) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(e))),
                          );
                        })
                            .toList()
                            .toList(),
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(
                              decelerationRate: ScrollDecelerationRate.fast),
                          height: 200,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: true,
                          autoPlay: true,
                          pageSnapping: true,
                          autoPlayInterval: const Duration(seconds: 8),
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        )),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (){
              // print("object");
              // EasyLoading.show(status: 'Chargement...');
              // // Utilisez un Timer pour masquer l'indicateur après  3 secondes
              // Timer(Duration(seconds:  3), () {
              //   EasyLoading.dismiss();
              // });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearPercentIndicator(
                animation: c.startanimation,
                restartAnimation: true,
                animationDuration: 5000,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                lineHeight: 4.0,
                percent: 1,
                backgroundColor: ColorApp.textColor2,
                progressColor: ColorApp.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }


  callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {});
  }
}
