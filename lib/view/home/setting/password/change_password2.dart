import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';



import '../../../../component/style/color.dart';
import '../../../../component/widget/bouton_custom.dart';
import '../../../../component/widget/text_ibm_plex_sans.dart';
import '../../../../service/callapi/authentification/authentifaction.dart';
import '../../../../service/connection/connectionchecker.dart';


class ChangePassword2 extends StatefulWidget {
  const ChangePassword2({Key? key}) : super(key: key);

  @override
  State<ChangePassword2> createState() => _ChangePassword2State();
}

class _ChangePassword2State extends State<ChangePassword2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool isCheck = false;
  // final FocusNode _focusPhone = FocusNode();
  final FocusNode _focusCode = FocusNode();
  final FocusNode _focusConfirm = FocusNode();
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "password".tr,
          style: const TextStyle(fontSize: 26),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "msgChangePassword".tr,
                style: const TextStyle(color: ColorApp.textColor2),
              ),
              const SizedBox(
                height: 28,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(

                        textInputAction: TextInputAction.next,
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                        controller: oldPasswordController,
                        keyboardType: TextInputType.visiblePassword,

                        decoration: InputDecoration(

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
                          hintText: 'currentPassword'.tr,
                          labelStyle: const TextStyle(
                              color: ColorApp.onBackground, fontSize: 14),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {

                            return "currentPassword".tr;
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      TextFormField(

                        textInputAction: TextInputAction.next,
                        autofillHints: const [
                          AutofillHints.password,
                        ],
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,

                        decoration: InputDecoration(

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
                          hintText: 'newPassword'.tr,
                          labelStyle: const TextStyle(
                              color: ColorApp.onBackground, fontSize: 14),
                        ),
                        validator: (value) { if (value!.trim().isEmpty) {
                          return "newPassword".tr;
                        }
                        if (value.length < 8) {
                          return "lengthPassword".tr;
                        }
                        return null;
                        },
                      ),



                      const SizedBox(
                        height: 16,
                      ),

                      TextFormField(

                        textInputAction: TextInputAction.next,
                        autofillHints: const [
                          AutofillHints.password,
                        ],
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,

                        decoration: InputDecoration(

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
                          hintText: 'confirmNewPassword'.tr,
                          labelStyle: const TextStyle(
                              color: ColorApp.onBackground, fontSize: 14),
                        ),
                        validator: (value) { if (value!.trim().isEmpty) {
                          return "confirmNewPassword".tr;
                        }
                        if (value != passwordController.text) {
                          return "entreSamePassword".tr;
                        }
                        return null;
                        },
                      ),


                      const SizedBox(
                        height: 30,
                      ),
                      Boutoncustom(
                        color: ColorApp.primary,
                        onPressed: ()async {

                          EasyLoading.show(status: 'loading...');
                          if (_formKey.currentState!
                              .validate()) {
                            _formKey.currentState!.save();

                            result = await Connexioncheck.checkconnection();
                            if(result==true){
                              Authentification.changepassword(context, oldPasswordController.text, passwordController.text);
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
                          text: 'updatePassword'.tr,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
