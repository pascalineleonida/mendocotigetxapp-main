import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/appconfig/constant.dart';
import 'package:mendocoti_appmobile_flutter/component/widget/footerpage.dart';
import 'package:mendocoti_appmobile_flutter/view/home/homepage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../component/style/color.dart';
import '../../component/widget/bouton_custom.dart';
import '../../component/widget/help.dart';
import '../../component/widget/text_ibm_plex_sans.dart';
import '../../model/usermodel.dart';
import '../../model/usermodeldata.dart';
import '../../service/callapi/authentification/authentifaction.dart';
import '../../service/connection/connectionchecker.dart';
import '../../service/controller/controller.dart';
import '../../util/helpers/regex_format.dart';
import '../signup/registerpart1.dart';
import 'forgotpassword/resetpassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController emailForgetController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();

  bool _osbcutext = true;
  bool _press = true;
  _loseFocus() {
    _focusEmail.hasFocus ? _focusEmail.unfocus() : null;
    _focusPassword.hasFocus ? _focusPassword.unfocus() : null;
  }
  bool login=false;
  var result;

  islogin(){
    setState(() {
      login=!login;
    });
  }


  isconnected() async{

    if(UserModeldata.sessionusers == null){
      setState(() {
        login = false;
      });
      print(login);
    }else{
      setState(() {
        login = true;
      });
    }
    print("login");
    print(login);

  }
  Controller c = Get.put(Controller());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isconnected();
  }



  @override
  Widget build(BuildContext context) {
    return login==true?HomepageView(login: islogin) :Scaffold(
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
                      "niceToSeeYouAgain".tr,
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.secondary),
                      textAlign: TextAlign.center,
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
                      "login".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorApp.secondary,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Form(
                        key: _formKey,
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
                              onTap: (){
                                EasyLoading.dismiss();
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                filled: true,
                                fillColor: ColorApp.background,
                                hintStyle: TextStyle(color: ColorApp.onBackground.withOpacity(0.3)),
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
                            const SizedBox(
                              height: 40,
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
                                hintStyle: TextStyle(color: ColorApp.onBackground.withOpacity(0.3)),
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),
                              onTap: (){
                                EasyLoading.dismiss();
                              },
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
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.to(Forgotpassword());
                                    },
                                    child: Text(
                                      "forgetPw".tr,
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
                            Boutoncustom(
                              color: ColorApp.primary,
                              onPressed: ()async {

                                EasyLoading.show(status: 'loading...');
                                if (_formKey.currentState!
                                    .validate()) {
                                  _formKey.currentState!.save();
                                  _loseFocus();
                                result = await Connexioncheck.checkconnection();
                                if(result==true){
                                   Authentification.login(context, emailController.text, passwordController.text);
                                }else{
                                  EasyLoading.dismiss();
                                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                    content: Text("noconnect".tr),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              print(result);


                                }else{
                                  EasyLoading.dismiss();
                                }
                              },
                              text: IBMPlexSans(
                                text: 'login'.tr,
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
                                      Get.to(RegisterPart1(),transition: Transition.cupertino);
                                    },
                                    child: Text(
                                      "register".tr,
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
