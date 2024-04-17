import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/view/home/setting/password/change_password2.dart';

import '../../../../../util/helpers/regex_format.dart';
import '../../../../component/style/color.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    children: [
                      TextFormField(
                        readOnly: true,
                        initialValue: 'qwertyuioi',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelStyle:
                              TextStyle(color: ColorApp.onBackground, fontSize: 14),
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "enterEmail".tr;
                          }
                          if (!RegExp(RegexFormat.regexEmail).hasMatch(value)) {
                            return "enterCorrectEmail".tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )),
              InkWell(
                  onTap: () {
                    Get.to(ChangePassword2(),transition: Transition.cupertino,duration: Duration(seconds: 1));
                  },
                  child: Text(
                    "updatePassword".tr,
                    style:
                        const TextStyle(color: ColorApp.primary, fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
