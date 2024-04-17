import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/model/profilusermodel.dart';
import 'package:mendocoti_appmobile_flutter/model/usermodeldata.dart';
import 'package:mendocoti_appmobile_flutter/view/home/setting/password/change_password.dart';
import 'package:mendocoti_appmobile_flutter/view/home/setting/user_info/info_user.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../component/style/color.dart';
import '../../../component/widget/setting_item.dart';
import '../../../component/widget/text_ibm_plex_sans.dart';
import '../../../service/controller/controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../util/helpers/g.dart';
import 'language/languageview.dart';
import 'other/checkpayement.dart';

class Settingview extends StatefulWidget {
  const Settingview({super.key});

  @override
  State<Settingview> createState() => _SettingviewState();
}

class _SettingviewState extends State<Settingview> {

  var locale= Get.deviceLocale;

  Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
        Row(children: [  Container(
            height: 100,
            width: 100,
            child: Container(
                height: 150,
                width: 150,

                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {

                      },
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: ClipOval(
                            child:
                             Obx(() =>  c.allimage.isEmpty?CachedNetworkImage(
                              imageUrl:
                              "${Profiluser.sessionusers!.url!.base}${Profiluser.sessionusers!.imageLogo == null ? "" : Profiluser.sessionusers!.imageLogo!.mobile!.first}",
                              fit: BoxFit
                                  .cover,
                              progressIndicatorBuilder: (context,
                                  url,
                                  downloadProgress) =>
                                  CircularProgressIndicator(
                                    value: downloadProgress
                                        .progress,
                                    color: ColorApp
                                        .primary,
                                  ),
                              errorWidget:
                                  (context,
                                  url,
                                  error) =>
                                  Icon(
                                    Icons
                                        .person,
                                    size: 70,
                                    color: Colors
                                        .black,
                                  ),
                            ):Image.file(c.allimage.first.absolute,fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child:
                        GestureDetector(
                          onTap: () {
                            c.modalselectsource();
                          },
                          child:
                          CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            child: Icon(Icons
                                .upload,color: Colors.white,),
                          ),
                        ))
                  ],
                ))),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                "${Profiluser.sessionusers!.name} ${Profiluser.sessionusers!.firstName}",
                style: const TextStyle(
                    fontWeight:
                    FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${UserModeldata.sessionusers!.email}",
                style: const TextStyle(
                    color:
                    ColorApp.textColor2,
                    fontSize: 12),
              ),
              const Divider(),
              Text(
                'codes ${Profiluser.sessionusers!.code}',
                style: const TextStyle(
                    color:
                    ColorApp.textColor2,
                    fontWeight:
                    FontWeight.w500,
                    fontSize: 12),
              ),
            ],
          )],),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SettingsItem(
                  assetImage:
                  'assets/svg/settings-personal-information.svg',
                  onTap: () {
                    Get.to(InfoUserPage(),transition: Transition.cupertino,duration: Duration(seconds: 2));

                  },
                  title: "personalInformation".tr,
                  subtitle: "personalInformation".tr,
                ),
                SettingsItem(
                  assetImage:
                  'assets/svg/settings-password.svg',
                  onTap: () {
                    Get.to(ChangePassword(),transition: Transition.cupertino,duration: Duration(seconds: 2));

                  },
                  title: "password".tr,
                  subtitle: "password".tr,
                ),
                //TODO: Add savings account.
                // SettingsItem(
                //   assetImage:
                //       'assets/svg/settings-monetisation.svg',
                //   onTap: () {
                //     if (!prefs.containsKey(
                //         "firstMonetize")) {
                //       prefs.setString(
                //           "firstMonetize",
                //           "firstMonetize");
                //       Navigator.of(context)
                //           .pushNamed(
                //               Routes.monetization);
                //     } else {
                //       Navigator.of(context)
                //           .push(MaterialPageRoute(
                //         builder: (context) =>
                //             const Monetize(
                //           amount: 5.0,
                //           canWithdraw: true,
                //         ),
                //       ));
                //     }
                //   },
                //   title: monetizeTitle,
                //   subtitle:
                //       monetizeSubtitle,
                // ),
                SettingsItem(
                  assetImage:
                  'assets/svg/setting-legal-information.svg',
                  onTap: () {
                    G.launchBroswer(
                        uri:
                        'https://docs.google.com/document/d/1ifqEm77qzRHHx1kiYsdkOOfDpkCGoTqZaKHDigSA-wg/edit');
                  },
                  title:
                  "legalInformation".tr,
                  subtitle:
                  "legalInformation".tr,
                ),
                SettingsItem(
                  iconData: const Icon(
                      Icons.add_box_outlined),
                  onTap: () {
                Get.to(Checkpayment(),transition: Transition.cupertino,duration: Duration(milliseconds: 1000));
                  },
                  title: "other".tr,
                ),
                //TODO: Add donation.

                SettingsItem(
                    assetImage:
                    'assets/svg/settings-switch.svg',
                    onTap: () {
                     Get.to(LanguageView());
                    },
                    title: "switchTo".tr,
                    ),
              

                SettingsItem(
                  assetImage:
                  'assets/svg/settings-help.svg',
                  onTap: () {
                    G.launchBroswer(
                        uri:
                        'https://coti.mendo.cm/faq');
                  },
                  title: "helpSupport".tr,
                ),
                SettingsItem(
                  assetImage:
                  'assets/svg/settings-delete-account.svg',
                  onTap: () {
                    checkdeletmodal()=> Get.bottomSheet(

                      enableDrag: true,
                      isDismissible: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,

                        exitBottomSheetDuration: Duration(milliseconds: 400),
                        elevation: 25,
                        Container(

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                          IBMPlexSans(
                                            text: "dearuser".tr,
                                            color: ColorApp.onBackground,
                                            fontWeight: FontWeight.w600,
                                            size: 15,maxLines: 8,
                                          ),
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 5.w),
                             child: Column(
                               children: [
                                 Text("deletecomptetext1".tr,textAlign: TextAlign.center,),
                                 SizedBox(
                                   height: 3,
                                 ),
                                 Text("deletecomptetext2".tr,textAlign: TextAlign.center,),
                                 SizedBox(
                                   height: 3,
                                 ),
                                 Text("deletecomptetext3".tr,textAlign: TextAlign.center,),
                                 SizedBox(
                                   height: 3,
                                 ),
                                 Text("deletecomptetext4".tr,textAlign: TextAlign.center,),
                                 SizedBox(
                                   height: 3,
                                 ),
                                 Text("deletecomptetext5".tr,textAlign: TextAlign.center,),
                              SizedBox(
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
                               ],
                             ),
                           )
                          ],),
                        )
                    );
                    checkdeletmodal();
                    // modalDelete(context) => showModalBottomSheet(
                    //     context: context,
                    //     isScrollControlled: true,
                    //     shape: const RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.only(
                    //             topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                    //     builder: (context) => Column(
                    //       mainAxisSize: MainAxisSize.max,
                    //       children: [
                    //         Align(
                    //           alignment: Alignment.topRight,
                    //           child: IconButton(
                    //               onPressed: () {
                    //                 Get.back();
                    //               },
                    //               icon: const Icon(
                    //                 Icons.close,
                    //                 color: ColorApp.onBackground,
                    //               )),
                    //         ),
                    //         SvgPicture.asset(
                    //           'assets/svg/deleteimage.svg',
                    //           height: 226,
                    //           width: 216,
                    //         ),
                    //         IBMPlexSans(
                    //           text: "quit".tr,
                    //           fontWeight: FontWeight.bold,
                    //           size: 20,
                    //           color: ColorApp.onBackground,
                    //         ),
                    //         const SizedBox(
                    //           height: 10,
                    //         ),
                    //         Container(
                    //
                    //           child: Column(
                    //             children: [
                    //               IBMPlexSans(
                    //                 text: "dearuser".tr,
                    //                 color: ColorApp.onBackground,
                    //                 fontWeight: FontWeight.w400,
                    //                 size: 10,maxLines: 8,
                    //               ),
                    //               const SizedBox(
                    //                 height: 18,
                    //               ),
                    //               IBMPlexSans(
                    //                 text: "deletecomptetext1".tr,
                    //                 color: ColorApp.onBackground,
                    //                 fontWeight: FontWeight.w400,
                    //                 size: 10,
                    //                 maxLines: 6,
                    //               ),
                    //               const SizedBox(
                    //                 height: 10,
                    //               ),
                    //               IBMPlexSans(
                    //                 text: "deletecomptetext2".tr,
                    //                 color: ColorApp.onBackground,
                    //                 fontWeight: FontWeight.w400,
                    //                 size: 10,
                    //                 maxLines: 3,
                    //               ),
                    //               const SizedBox(
                    //                 height: 10,
                    //               ),
                    //               IBMPlexSans(
                    //                 text: "deletecomptetext3".tr,
                    //                 color: ColorApp.onBackground,
                    //                 fontWeight: FontWeight.w400,
                    //                 size: 10,
                    //                 maxLines: 5,
                    //               ),
                    //               const SizedBox(
                    //                 height: 10,
                    //               ),
                    //               IBMPlexSans(
                    //                 text: "deletecomptetext4".tr,
                    //                 color: ColorApp.onBackground,
                    //                 fontWeight: FontWeight.w400,
                    //                 size: 10,
                    //                 maxLines: 5,
                    //               ),
                    //               IBMPlexSans(
                    //                 text: "deletecomptetext5".tr,
                    //                 color: ColorApp.onBackground,
                    //                 fontWeight: FontWeight.w500,
                    //                 size: 10,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           height: 10,
                    //         ),
                    //         Container(
                    //           margin: const EdgeInsets.symmetric(horizontal: 23),
                    //           child: ElevatedButton(
                    //               style: ElevatedButton.styleFrom(
                    //                   backgroundColor: ColorApp.delete,
                    //                   shape: RoundedRectangleBorder(
                    //                       borderRadius: BorderRadius.circular(30))),
                    //               onPressed: () {
                    //                 G.launchBroswer(
                    //                     uri:
                    //                     'https://coti.mendo.cm/account/delete/${UserModeldata.sessionusers!.authKey.toString()}/${UserModeldata.sessionusers!.token.toString()}');
                    //               },
                    //               child: IBMPlexSans(
                    //                 text: "deleteAccountdefinitif".tr,
                    //                 textAlign: TextAlign.center,
                    //                 color: ColorApp.onPrimary,
                    //                 fontWeight: FontWeight.w400,
                    //                 // decoration: TextDecoration.underline,
                    //                 size: 14,
                    //               )),
                    //         ),
                    //         const SizedBox(
                    //           height: 20,
                    //         ),
                    //       ],
                    //     ));
                    // modalDelete(context);
                  },
                  title: "deleteAccount".tr,
                ),
                ListTile(
                    leading: const SizedBox(),
                    onTap: () async {
                      UserModeldata.logout();

                    },
                    title: Text("logout".tr,
                        style: const TextStyle(
                          fontWeight:
                          FontWeight.w500,
                          fontSize: 18,
                          color: ColorApp.delete,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
