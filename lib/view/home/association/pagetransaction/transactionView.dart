import 'dart:ui';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/footerpage.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/text_ibm_plex_sans.dart';
import 'package:mendocoti_appmobile_flutter/util/helpers/helpers.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../component/style/color.dart';
import '../../../../component/widget/bouton_custom.dart';
import '../../../../component/widget/cardprovider.dart';
import '../../../../component/widget/cardshimer.dart';
import '../../../../component/widget/transactioncard.dart';
import '../../../../model/projetmodel.dart';
import '../../../../model/transactionpaymodel.dart';
import '../../../../service/callapi/structure/structureapicall.dart';
import '../../../../service/connection/connectionchecker.dart';
import '../../../../service/controller/controller.dart';
import '../../../../service/controller/transitioncontroller.dart';

class TransactionView extends StatefulWidget {
  final Projetmodels dataassociation;

  const TransactionView({super.key, required this.dataassociation});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  Transitioncontroller s = Get.put(Transitioncontroller());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNodeAmount = FocusNode();
  FocusNode focusNodePhone = FocusNode();
  FocusNode focusNodeCodeMember = FocusNode();
  TextEditingController phone = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController codeMember = TextEditingController();
  TextEditingController reference = TextEditingController();

  List<Transactionpaymodel> _transactions = [];
  bool isOM = false;
  var page = 2;
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scroll = ScrollController();
  bool change = false;
  double startposition = 0.00;
  bool isLoading = true;
  bool check = false;
  String totalAmountuser = "";
  String totalAmount = "";
  String totalglobal = "";
  String totaltarget = "";
  String visibilityAmount = "";
  int pers = 0;
  double progress = 0;
  double progressall = 0;
  double cible = 0;
  bool full = false;
  bool fullall = false;
  bool view = false;
  bool viewall = false;

  Controller c = Get.find();

  getmodalpay() {
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('donateContribution'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("donateMessage".tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic)),
                            const SizedBox(
                              height: 20,
                            ),
                            CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: check,
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                onChanged: (bool? value) {
                                  setState(() {
                                    check = value!;
                                    if(check==false){
                                      codeMember.clear();
                                    }
                                    print(check);
                                  });
                                },
                                title: IBMPlexSans(
                                  text: "buyforother".tr,
                                  color: ColorApp.onBackground,
                                )),
                            Visibility(
                              visible: check,
                              child: TextFormField(
                                focusNode: focusNodeCodeMember,
                                textInputAction: TextInputAction.next,
                                autofillHints: const [
                                  AutofillHints.email,
                                ],
                                controller: codeMember,
                                keyboardType: TextInputType.number,
                                onTap: () {
                                  EasyLoading.dismiss();
                                },
                                decoration: InputDecoration(
                                  // prefixIcon: const Icon(Icons.code_rounded),
                                  filled: true,
                                  fillColor: ColorApp.background,
                                  hintStyle: TextStyle(
                                      color: ColorApp.onBackground
                                          .withOpacity(0.3)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: ColorApp.primary)),
                                  hintText: "codeMember".tr,
                                  labelStyle: const TextStyle(
                                      color: ColorApp.onBackground,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(

                              textInputAction: TextInputAction.next,
                              controller: reference,
                              keyboardType: TextInputType.text,
                              onTap: () {
                                EasyLoading.dismiss();
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorApp.background,
                                hintStyle: TextStyle(
                                    color:
                                    ColorApp.onBackground.withOpacity(0.3)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                    BorderSide(color: ColorApp.primary)),
                                hintText: "${"reference"} ",
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),

                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              focusNode: focusNodeAmount,
                              textInputAction: TextInputAction.next,
                              controller: amount,
                              keyboardType: TextInputType.number,
                              onTap: () {
                                EasyLoading.dismiss();
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorApp.background,
                                hintStyle: TextStyle(
                                    color:
                                        ColorApp.onBackground.withOpacity(0.3)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: ColorApp.primary)),
                                hintText: "${'amount'.tr} *",
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "enter".tr;
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              focusNode: focusNodePhone,
                              textInputAction: TextInputAction.next,
                              autofillHints: const [
                                AutofillHints.postalCode,
                              ],
                              controller: phone,
                              keyboardType: TextInputType.phone,
                              onTap: () {
                                EasyLoading.dismiss();
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorApp.background,
                                hintStyle: TextStyle(
                                    color:
                                        ColorApp.onBackground.withOpacity(0.3)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: ColorApp.primary)),
                                hintText: '${"phoneNumber".tr} *',
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "enterPhone".tr;
                                }
                                if (!RegExp(HPhoneNumber.regexNumberCam)
                                    .hasMatch(phone.text.replaceAll(' ', ''))) {
                                  return "enterCorrectPhone".tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: RadioListTile<bool>(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      title: const Text(
                                        'Orange Money',
                                        style: TextStyle(),
                                      ),
                                      value: true,
                                      groupValue: isOM,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isOM = value!;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RadioListTile<bool>(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      title: const Text(
                                        'MTN Mobile Money',
                                        style: TextStyle(),
                                      ),
                                      value: false,
                                      groupValue: isOM,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isOM = value!;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            // Text(
                            //   "donateConfirm".trParams({
                            //     'amount': RegexFormat.moneyFormat(amount.text),
                            //     'phoneNumber': phone.text,
                            //     'operator': isOM ? "Orange Money" : "Mobile Money",
                            //     'nameProject': widget.dataassociation.name.toString(),
                            //   }),
                            //   style: TextStyle(
                            //     color: Colors.blueAccent,
                            //     fontSize: MediaQuery.of(context).size.width * 0.05, // 5% of screen width
                            //   ),
                            // ),
                            Boutoncustom(
                              text: IBMPlexSans(
                                text: 'pay'.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                size: 16.sp,
                              ),
                              color: ColorApp.primary,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Get.back();
                                  c.infocontact.clear();
                                  if(codeMember.text.isEmpty){
                                     alertdialog();
                                  }else{
                                    EasyLoading.show(status: 'loading...');
                                    checkdata()async{
                                      c.infocontact.clear();
                                      var data = await c.getusers(codeMember.text);
                                      if(data != null){
                                        alertdialog();
                                      }
                                    }
                                    checkdata();



                                    if(c.infocontact.isNotEmpty){

                                      alertdialog();
                                    }else{

                                    }
                                  }



                                }
                              },
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(child: Footer()),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }

  alertdialog() {

    Get.dialog(Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IBMPlexSans(text: "infopay".tr),
          SizedBox(
            height: 1.h,

          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
                text: TextSpan(
                    text: codeMember.text.isNotEmpty?"personcontribute".tr:"",
                    style: TextStyle(color: Colors.black),
                    children: [
                      if(codeMember.text.isNotEmpty)
                  TextSpan(
                      text: " ${c.infocontact.first.name} ",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                      if(codeMember.text.isNotEmpty)
                      TextSpan(
                          text: " ${"codeuser".tr} ",
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      if(codeMember.text.isNotEmpty)
                      TextSpan(
                          text: " ${c.infocontact.first.code}",
                          style: TextStyle(fontWeight: FontWeight.w700)),

                  TextSpan(
                      text: " ${"first1".tr} ",
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " ${amount.text} ",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: "first2".tr,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " ${phone.text} ",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: "first3".tr,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " ${isOM ? "Orange Money" : "Mobile Money"} ",
                      style: TextStyle(
                          color: isOM ? Color(0xffff6501) : Color(0xffffcc0f),
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: "first4".tr,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " ${widget.dataassociation.name.toString()} ",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ])),
          ),
          InkWell(
            onTap: () {
Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: ColorApp.primary,
                        )),
                    child: IBMPlexSans(
                      text: 'no'.tr,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      EasyLoading.show(status: 'loading...');
                      bool result = await Connexioncheck.checkconnection();
                      if (result == true) {
                        Get.back();
                        StructureAPIcall.payforprojet(
                            context,
                            c.infocontact.isEmpty?null:c.infocontact.first.id,
                            amount.text.toString(),
                            phone.text.toString(),
                            isOM ? "OM" : "MOMO",
                            widget.dataassociation.id.toString(),
                            reference.text,
                        );
                      } else {
                        EasyLoading.dismiss();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("noconnect".tr),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: ColorApp.primary,
                          borderRadius: BorderRadius.circular(30)),
                      child: IBMPlexSans(
                        text: 'yes'.tr,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  getdata() async {
    var data = await StructureAPIcall.checktransaction(
         widget.dataassociation.id);
    print(data);
    if (data != null) {
      setState(() {
        isLoading = false;
        _transactions.clear;
        _transactions.add(Transactionpaymodel.fromJson(data));
      });
      print(_transactions.length);
      print("_transactions.length");
    }
  }

  checkprogress() {
    totalAmountuser = widget.dataassociation.montantTotal.toString();
    totalAmount = widget.dataassociation.totalAmount.toString();
    if (totalAmountuser == "0") {
      setState(() {
        progress = 0;
        view = true;
      });
    } else {
      var useramount = int.parse(totalAmountuser);
      var usercibleamount = int.parse(totalAmount);
      if (useramount >= usercibleamount) {
        progress = 1;
        full = true;
      } else {
        progress = useramount / usercibleamount;
      }
    }
  }

  checkprogressall() {
    visibilityAmount =
        widget.dataassociation.visibilityAmount!.amount.toString();
    totaltarget = widget.dataassociation.totalTarget.toString();

    if (visibilityAmount == "null") {
      setState(() {
        progressall = 0;
        viewall = true;
      });
    } else {
      var visibilityAmounts = int.parse(visibilityAmount);
      var totaltargets = int.parse(totaltarget);
      if (visibilityAmounts >= totaltargets) {
        progressall = 1;
        fullall = true;
      } else {
        progressall = visibilityAmounts / totaltargets;
      }
    }

    // var visibility_amounts = int.parse(visibility_amount);
    // var useramountarget = int.parse(totaltarget);

    // if(visibility_amounts>=useramountarget){
    //   progressall = 1;
    //   fullall = true;
    // }else{
    //   progressall = visibility_amounts/useramountarget;

    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.dataassociation.id);
    print(widget.dataassociation.status);
    checkprogress();
    checkprogressall();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_outlined),),
        title: IBMPlexSans(
          text: widget.dataassociation.association!.name.toString(),
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            Container(
              color: change ? ColorApp.onPrimary : Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.w,
                    child: Text(
                      widget.dataassociation.name.toString().ucfirst() ?? '',
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.secondary),
                    ),
                  ),
                  if (widget.dataassociation.status == 1)
                    SizedBox(
                      width: 30.w,
                      height: 4.6.h,
                      child: Boutoncustom(
                        text: IBMPlexSans(
                          text: "pay".tr,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          size: 16.sp,
                        ),
                        color: ColorApp.primary,
                        onPressed: () {
                          EasyLoading.dismiss();
                          getmodalpay();
                        },
                      ),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: ListView(
                  controller: _scroll,
                  shrinkWrap: true,
                  children: [
                    ExpandableText(
                      widget.dataassociation.description.toString(),
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 2.2.h,
                        fontWeight: FontWeight.w400,
                      ),
                      animation: true,
                      expandText: 'voir plus',
                      collapseText: 'masqué',
                      maxLines: 2,
                      linkColor: ColorApp.primary,
                    ),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.dataassociation.countMember!.toInt() >= 2)
                          Row(
                            children: [
                              const Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 24),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: ColorApp.BlueColortext,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 14),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: ColorApp.delete,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 1),
                                    child: CircleAvatar(
                                      radius: 10,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              if (widget.dataassociation.countMember!.toInt() >=
                                  2)
                                Text(
                                  "${"you".tr} ${"and".tr.toLowerCase()} ${widget.dataassociation.countMember!.toInt() - 1} participants",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: ColorApp.textColor,
                                  ),
                                ),
                            ],
                          ),
                        Text(
                          "${"start".tr.ucfirst()}: ${widget.dataassociation.createdAt != null ? '${AppDate.dateTimeWithDay(DateTime.parse(widget.dataassociation.createdAt.toString()))}' : ''}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: ColorApp.textColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Divider(
                      height: 1,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            color: Color(0xffFFFCF8),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xffEFA83D).withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(4)),
                            elevation: 0.5,
                            child: Padding(
                              padding: EdgeInsets.all(1.5.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "good".tr,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              color: ColorApp.onBackground,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          "continueplan".tr,
                                          maxLines: 4,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 1.3.h,
                                            color: const Color(0xff676767),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Icon(
                                          Icons.open_in_new,
                                          weight: 20,
                                          color: const Color(0xff5090BF)
                                              .withOpacity(0.5),
                                          size: 5.w,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: CircularPercentIndicator(
                                      radius: 5.w,
                                      lineWidth: 1.w,
                                      circularStrokeCap: CircularStrokeCap.round,
                                      percent: progress,
                                      center: Text(
                                        " ${view ? (progress * 100) : (progress * 100).toString().substring(0, 3)}%",
                                        style: GoogleFonts.inter(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            color: ColorApp.primary),
                                      ),
                                      progressColor: ColorApp.primary,
                                      backgroundColor:
                                      ColorApp.primary.withOpacity(0.2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        widget.dataassociation.visibilityAmount!.status == true
                            ? Expanded(
                          child: Card(
                            color: Color(0xffFCFEFF),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color:
                                    Color(0xff5090BF).withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(4)),
                            elevation: 0.5,
                            child: Padding(
                              padding: EdgeInsets.all(1.5.w),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "objectifstruct".tr,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              color: ColorApp.onBackground,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          "objectifbut".tr,
                                          maxLines: 4,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 1.3.h,
                                            color: const Color(0xff676767),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Icon(
                                          Icons.open_in_new,
                                          weight: 20,
                                          color: const Color(0xff5090BF)
                                              .withOpacity(0.5),
                                          size: 5.w,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: CircularPercentIndicator(
                                      radius: 5.w,
                                      lineWidth: 1.w,
                                      circularStrokeCap:
                                      CircularStrokeCap.round,
                                      percent: progressall,
                                      center: Text(
                                        "${viewall ? (progressall * 100).toString() : (progressall * 100).toString().substring(0, 1)}%",
                                        style: GoogleFonts.inter(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            color: const Color(0xff5090BF)),
                                      ),
                                      progressColor:
                                      const Color(0xff5090BF),
                                      backgroundColor:
                                      const Color(0xff5090BF)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                            : const Expanded(child: SizedBox()),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "statistics".tr,
                      style: TextStyle(
                        fontSize: 3.5.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 0.5,
                            child: Padding(
                              padding: EdgeInsets.all(1.8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IBMPlexSans(
                                    text: "totaltransaction".tr,
                                    color: const Color(0xff3B362E),
                                    size: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    height: 1.2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      IBMPlexSans(
                                        text:
                                        '${"${widget.dataassociation.montantTotal} XAF"} ',
                                        color: ColorApp.primary,
                                        size: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      IBMPlexSans(
                                        text:
                                        " ${widget.dataassociation.totalAmount.toString()} XAF",
                                        color: full
                                            ? ColorApp.primary
                                            : const Color(0xff888888),
                                        size: 3.5.w.sp,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                  LinearPercentIndicator(
                                    animation: true,
                                    restartAnimation: false,
                                    padding: EdgeInsets.zero,
                                    lineHeight: 0.4.h,
                                    percent: progress.toDouble(),
                                    backgroundColor:
                                    ColorApp.textColor2.withOpacity(0.2),
                                    progressColor: ColorApp.primary,
                                    curve: Curves.bounceIn,
                                    barRadius: const Radius.circular(100),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        widget.dataassociation.visibilityAmount!.status == true
                            ? Expanded(
                          child: Card(
                            elevation: 0.5,
                            child: Padding(
                              padding: EdgeInsets.all(1.8.w),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      IBMPlexSans(
                                        text: "globaltransaction".tr,
                                        color: const Color(0xff3B362E),
                                        size: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      IBMPlexSans(
                                        text:
                                        "${widget.dataassociation.visibilityAmount!.amount} XAF",
                                        color: const Color(0xff5090BF),
                                        size: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      IBMPlexSans(
                                        text:
                                        "${widget.dataassociation.totalTarget.toString()} XAF",
                                        color: full
                                            ? const Color(0xff5090BF)
                                            : const Color(0xff888888),
                                        size: 3.5.w.sp,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                  LinearPercentIndicator(
                                    animation: true,
                                    restartAnimation: false,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    lineHeight: 0.4.h,
                                    percent: progressall.toDouble(),
                                    barRadius: const Radius.circular(100),
                                    backgroundColor: ColorApp.textColor2
                                        .withOpacity(0.2),
                                    progressColor: const Color(0xff5090BF),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                            : const Expanded(
                          child: SizedBox(),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        DisplayProvider(
                          color: Color(0xffff6501),
                          text: widget.dataassociation.montantTotalOm.toString(),
                          image: "assets/images/Orange Money Logo.png",
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        DisplayProvider(
                          color: Color(0xffffcc0f),
                          text:
                          widget.dataassociation.montantTotalMomo.toString(),
                          image: "assets/images/logo-mtn-momo.png",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("myTransactions".tr),
                        const Icon(
                          Icons.folder_special_outlined,
                          color: ColorApp.secondary,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (isLoading)
                      Column(
                        children: [
                          for (var i = 0; i < 5; i++)
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CardShimmer(
                                height: 50,
                              ),
                            ),
                        ],
                      )
                    else if (_transactions.isEmpty)
                      Center(
                        child: SvgPicture.asset(
                          'assets/svg/empty-data.svg',
                        ),
                      )
                    else if (_transactions.isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: _transactions.first.items!.length,
                            itemBuilder: (context, index) {
                              final value = _transactions.first.items![index];
                              return TransactionCard(
                                transaction: value,

                                dataProjetName: widget.dataassociation.name,
                                projetnameadd: widget
                                    .dataassociation.association!.name
                                    .toString(),
                                targetamount:
                                widget.dataassociation.totalAmount.toString(),
                              );
                            })
                  ],
                ))
          ],
        ),
      ),
    ), onRefresh: ()async{
      setState(() {
        _transactions.clear();
        getdata();
      });
    });
  }
}
