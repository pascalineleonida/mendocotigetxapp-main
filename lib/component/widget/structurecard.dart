import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';
import 'package:mendocoti_appmobile_flutter/util/extension/iterable_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../model/associationmodel.dart';
import '../../model/projetmodel.dart';
import '../../service/callapi/structure/structureapicall.dart';
import '../../service/controller/controller.dart';
import '../../util/helpers/app_date.dart';
import '../../view/home/association/pagetransaction/transactionView.dart';
import '../../view/home/association/qrcodeview.dart';
import '../animation/animationwidget.dart';
import '../style/color.dart';

class StructureCard extends StatefulWidget {
  final Items data;

  const StructureCard({super.key, required this.data});

  @override
  State<StructureCard> createState() => _StructureCardState();
}

class _StructureCardState extends State<StructureCard> {
  int currentindex = 0;
  Controller c = Get.find();

  viewmodal(setState) {
    Get.bottomSheet(
        backgroundColor: Colors.transparent,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.3),
        exitBottomSheetDuration: Duration(milliseconds: 400),
        enterBottomSheetDuration: Duration(milliseconds: 400),
        elevation: 25, StatefulBuilder(builder: (context, setState) {
      return Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(2),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/Icogroup1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: IBMPlexSans(
                    textAlign: TextAlign.start,
                    text: widget.data.name.toString(),
                    color: Colors.black,
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: IBMPlexSans(
                    text: 'code:${widget.data.code!.toString()}',
                    color: Colors.black,
                    textAlign: TextAlign.start,
                    size: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Get.to(
                          QrCodePage(
                            association: widget.data,
                          ),
                          transition: Transition.circularReveal,
                          duration: Duration(milliseconds: 400));
                    },
                    icon: const Icon(
                      Icons.qr_code,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 60.h,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.data.categories.isNullOrEmpty
                              ? []
                              : widget.data.categories!.map(
                                  (e) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentindex = widget.data.categories!
                                              .indexOf(e);
                                          c.projetdata.clear();
                                          c.checkprojetbycategory(
                                            e.id,
                                          );
                                          print(currentindex);
                                          print("projetdata");
                                        });
                                        print(
                                            widget.data.categories!.indexOf(e));
                                      },
                                      child: AnimatedContainer(
                                        width: 107.px,
                                        height: 35.px,
                                        decoration: BoxDecoration(
                                            color: currentindex ==
                                                    widget.data.categories!
                                                        .indexOf(e)
                                                ? Color(0xFFFFFAF3)
                                                : Colors.white,
                                            border: Border(
                                              bottom: BorderSide(
                                                color: currentindex ==
                                                        widget.data.categories!
                                                            .indexOf(e)
                                                    ? ColorApp.primary
                                                    : Colors.transparent,
                                                width: 2.0,
                                              ),
                                            ),
                                            boxShadow: []),
                                        duration: Duration(milliseconds: 400),
                                        child: Center(
                                          child: IBMPlexSans(
                                            text: e.code.toString(),
                                            color: currentindex ==
                                                    widget.data.categories!
                                                        .indexOf(e)
                                                ? ColorApp.primary
                                                : Color(0xffCECECE)
                                                    .withOpacity(1),
                                            fontWeight: currentindex ==
                                                    widget.data.categories!
                                                        .indexOf(e)
                                                ? FontWeight.w700
                                                : FontWeight.w500,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          child: GetBuilder<Controller>(
                              builder: (c) => c.projetdata.isEmpty
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Center(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IBMPlexSans(
                                                  text:
                                                      "Choisir une catégorie pour charger les projets",
                                                  color: Colors.grey),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              CircularProgressIndicator(
                                                color: ColorApp.primary,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: Column(
                                        children: c.projetdata
                                            .map(
                                              (e) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                        TransactionView(
                                                          dataassociation: e,
                                                        ),
                                                        transition: Transition
                                                            .circularReveal,
                                                        duration: Duration(
                                                            milliseconds: 400));
                                                  },
                                                  child: Delatanimationwidget(
                                                    delay: 3,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                          color: ColorApp
                                                              .background,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      width: double.infinity,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 100.w,
                                                            child: Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                IBMPlexSans(
                                                                  text: e.name
                                                                      .toString(),
                                                                  color: ColorApp
                                                                      .BlueColortext,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  size: 16.px,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              4),
                                                                  child:
                                                                      IBMPlexSans(
                                                                    text:
                                                                        "${e.countMember.toString()} participants",
                                                                    size: 14.sp,
                                                                    maxLines: 3,
                                                                    color: ColorApp
                                                                        .onBackground,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          IBMPlexSans(
                                                            text:
                                                                "${e.description.toString()}",
                                                            size: 14.sp,
                                                            maxLines: 3,
                                                            color: ColorApp
                                                                .onBackground,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          Container(
                                                            width: 100.w,
                                                            child: Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                IBMPlexSans(
                                                                  text:
                                                                      " ${e.montantTotal} Fcfa",
                                                                  size: 14.sp,
                                                                  color: ColorApp
                                                                      .onBackground,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                ),
                                                                IBMPlexSans(
                                                                  text:
                                                                      " ${e.totalAmount} Fcfa",
                                                                  maxLines: 3,
                                                                  size: 14.sp,
                                                                  color: ColorApp
                                                                      .onBackground,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          IBMPlexSans(
                                                            text:
                                                                "${"date".tr} : ${AppDate.dateTimeWithDay(
                                                              DateTime.parse(e
                                                                  .createdAt
                                                                  .toString()),
                                                            )}",
                                                            size: 10,
                                                            color: ColorApp
                                                                .onBackground,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    )))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewmodal(setState);
        setState(() {
          currentindex = 0;
          c.projetdata.clear();
          c.checkprojetbycategory(widget.data.categories!.first.id);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 60.w,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: const Color(0xff5090BF),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: ColorApp.onPrimary,
                  radius: 14.sp,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/Icogroup1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const Icon(
                  Icons.home,
                  size: 16,
                  color: Colors.white,
                ),
                // Middletex
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 8,
                ),
                IBMPlexSans(
                  text: widget.data.name.toString(),
                  color: ColorApp.onPrimary,
                  fontWeight: FontWeight.w600,
                  size: 16.sp,
                ),
              ],
            ),
            IBMPlexSans(
              text: widget.data.localisation!.name.toString(),
              color: ColorApp.onPrimary,
              fontWeight: FontWeight.w500,
              size: 14.sp,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Icon(
                //   Icons.add_circle,
                //   size: 15,
                // ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffCECECE),
                      fontStyle: FontStyle.italic,
                      fontSize: 12.sp),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
