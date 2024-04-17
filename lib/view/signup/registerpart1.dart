import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/view/signup/registerpart2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../appconfig/constant.dart';
import '../../component/style/color.dart';
import '../../component/widget/bouton_custom.dart';
import '../../component/widget/footerpage.dart';
import '../../component/widget/help.dart';
import '../../component/widget/text_ibm_plex_sans.dart';
import '../../util/helpers/g.dart';
import '../../util/helpers/regex_format.dart';

class RegisterPart1 extends StatefulWidget {
  const RegisterPart1({super.key});

  @override
  State<RegisterPart1> createState() => _RegisterPart1State();
}

class _RegisterPart1State extends State<RegisterPart1> {
  final GlobalKey<FormState> _frmKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController emailForgetController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  final FocusNode _focuspasswordConfirmController = FocusNode();
  bool _osbcutext = true;
  bool _press = true;
  bool isCheck = false;

  _loseFocus() {
    _focusEmail.hasFocus ? _focusEmail.unfocus() : null;
    _focusPassword.hasFocus ? _focusPassword.unfocus() : null;
    _focuspasswordConfirmController.hasFocus
        ? _focuspasswordConfirmController.unfocus()
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    Image.asset(
                      Constants.logoapps,
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "welcome1".tr,
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.secondary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      Constants.appname,
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.primary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'findAssociationsMsg'.tr,
                      style: const TextStyle(
                          fontSize: 18, color: ColorApp.secondary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "signup".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorApp.secondary,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Form(
                        key: _frmKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              focusNode: _focusEmail,
                              textInputAction: TextInputAction.next,
                              autofillHints: const [
                                AutofillHints.email,
                              ],
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
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
                                hintText: 'email'.tr,
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    _press = true;
                                  });
                                  return "enterEmail".tr;
                                }
                                if (!RegExp(RegexFormat.regexEmail)
                                    .hasMatch(value)) {
                                  return 'enterCorrectEmail'.tr;
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormField(
                              focusNode: _focusPassword,
                              textInputAction: TextInputAction.done,
                              autofillHints: const [
                                AutofillHints.password,
                              ],
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: ColorApp.background,
                                filled: true,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _osbcutext = !_osbcutext;
                                      });
                                    },
                                    icon: Icon(_osbcutext
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                    BorderSide(color: ColorApp.primary)),
                                hintText: "password".tr,
                                hintStyle: TextStyle(
                                    color:
                                        ColorApp.onBackground.withOpacity(0.3)),
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),
                              obscureText: _osbcutext,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    _press = true;
                                  });
                                  return "enterPassword".tr;
                                }

                                return null;
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormField(
                              focusNode: _focuspasswordConfirmController,
                              textInputAction: TextInputAction.done,
                              autofillHints: const [
                                AutofillHints.password,
                              ],
                              controller: passwordConfirmController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: ColorApp.background,
                                filled: true,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _osbcutext = !_osbcutext;
                                      });
                                    },
                                    icon: Icon(_osbcutext
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                    BorderSide(color: ColorApp.primary)),
                                hintText: "confirmPassword".tr,
                                hintStyle: TextStyle(
                                    color:
                                        ColorApp.onBackground.withOpacity(0.3)),
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),
                              obscureText: _osbcutext,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    _press = true;
                                  });
                                  return "confirmPassword".tr;
                                }
                                if (value != passwordController.text) {
                                  return 'entreSamePassword';
                                }

                                return null;
                              },
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: isCheck,
                                onChanged: (value) {
                                  setState(() {
                                    isCheck = value!;
                                  });
                                },
                                title: RichText(
                                    text: TextSpan(
                                        text: "terms1".tr,
                                        children: [
                                          TextSpan(
                                              text: "terms2".tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: "terms3".tr,
                                              style: const TextStyle()),
                                          TextSpan(
                                              text: "terms4".tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorApp.primary),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  G.launchBroswer(
                                                      uri:
                                                          'https://docs.google.com/document/d/1ifqEm77qzRHHx1kiYsdkOOfDpkCGoTqZaKHDigSA-wg/edit');
                                                }),
                                        ],
                                        style: const TextStyle(
                                            color: ColorApp.onBackground,
                                            fontSize: 12)))),
                            SizedBox(
                              height: 1.h,
                            ),
                            Boutoncustom(
                              color: ColorApp.primary,
                              onPressed: isCheck == false
                                  ? null
                                  : () {

                                      if (_frmKey.currentState!.validate()) {
                                        _frmKey.currentState!.save();
                                        _loseFocus();

                                        Get.to(RegisterPart2(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ));
                                      } else {}
                                    },
                              text: IBMPlexSans(
                                text: 'next'.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "haveAccount".tr,
                                      style: const TextStyle(
                                          fontFamily: Constants.raleway,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontStyle: FontStyle.italic,
                                          color: Color(0xff374957)),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          Help()
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
