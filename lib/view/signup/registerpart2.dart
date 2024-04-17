import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../appconfig/constant.dart';
import '../../component/style/color.dart';
import '../../component/widget/bouton_custom.dart';
import '../../component/widget/footerpage.dart';
import '../../component/widget/help.dart';
import '../../component/widget/text_ibm_plex_sans.dart';
import '../../service/callapi/authentification/authentifaction.dart';
import '../../util/helpers/g.dart';
import '../../util/helpers/regex_format.dart';

class RegisterPart2 extends StatefulWidget {
  final String email;
  final String password;


  const RegisterPart2({super.key, required this.email, required this.password});

  @override
  State<RegisterPart2> createState() => _RegisterPart1State();
}

class _RegisterPart1State extends State<RegisterPart2> {
  final GlobalKey<FormState> _formsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeysForgetChange = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final FocusNode _focusFirstName = FocusNode();
  final FocusNode _focusLastName = FocusNode();
  final FocusNode _focusPhone = FocusNode();
  final FocusNode _focusDate = FocusNode();
  bool _osbcutext = true;
  bool _press = true;
  String gender = "M";

  bool _isMen = true;
  _loseFocus() {
    _focusFirstName.hasFocus ? _focusFirstName.unfocus() : null;
    _focusLastName.hasFocus ? _focusLastName.unfocus() : null;
    _focusPhone.hasFocus ? _focusPhone.unfocus() : null;

    _focusDate.hasFocus ? _focusDate.unfocus() : null;
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
                      "tellMore".tr,
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
                      'msgSignup2'.tr,
                      style: const TextStyle(
                          fontSize: 18, color: ColorApp.secondary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "aboutYou".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorApp.secondary,
                          fontSize: 24),
                    ),
                    Row(

                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: RadioListTile<bool>(
                              contentPadding: const EdgeInsets.all(0.0),
                              title: Text(
                                "mr".tr,
                                style: const TextStyle(),
                              ),
                              value: true,
                              groupValue: _isMen,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isMen = value!;
                                  gender = "M";
                                });
                                print(gender);
                              }),
                        ),
                        Expanded(
                          child: RadioListTile<bool>(
                              contentPadding: const EdgeInsets.all(0.0),
                              title: Text(
                                "ms".tr,
                                style: const TextStyle(),
                              ),
                              value: false,
                              groupValue: _isMen,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isMen = value!;
                                  gender = "F";

                                });
                                print(gender);
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Form(
                        key: _formsKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              focusNode: _focusFirstName,
                              textInputAction: TextInputAction.next,
                              autofillHints: const [
                                AutofillHints.email,
                              ],
                              controller: firstNameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
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
                                hintText: 'firstname'.tr,
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    _press = true;
                                  });
                                  return "enterFisrtName".tr;
                                }

                                return null;
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormField(
                              focusNode: _focusLastName,
                              textInputAction: TextInputAction.done,
                              autofillHints: const [
                                AutofillHints.password,
                              ],
                              controller: lastNameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: ColorApp.background,
                                filled: true,
                                prefixIcon: const Icon(Icons.person),

                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                    BorderSide(color: ColorApp.primary)),
                                hintText: "lastname".tr,
                                hintStyle: TextStyle(color: ColorApp.onBackground.withOpacity(0.3)),
                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground, fontSize: 14),
                              ),

                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    _press = true;
                                  });
                                  return "enterLastName".tr;
                                }

                                return null;
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormField(
                              focusNode: _focusDate,
                              textInputAction: TextInputAction.next,
                              controller: dateController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: ColorApp.background,
                                filled: true,
                                hintStyle: TextStyle(color: ColorApp.onBackground.withOpacity(0.3)),
                                prefixIcon: const Icon(Icons.calendar_month),

                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                    BorderSide(color: ColorApp.primary)),
                                hintText: "birthday".tr,

                                labelStyle: const TextStyle(
                                    color: ColorApp.onBackground,
                                    fontSize: 14),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    initialDatePickerMode: DatePickerMode.year,
                                    context: context,
                                    firstDate: DateTime(1900),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime.now()
                                        .subtract(const Duration(days: 365 * 18)),
                                    initialDate: DateTime.now()
                                        .subtract(const Duration(days: 365 * 18)));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    dateController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "enterBirthday".tr;
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            IntlPhoneField(
                              focusNode: _focusPhone,
                              textInputAction: TextInputAction.done,
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorApp.primary)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                hintStyle: TextStyle(color: ColorApp.onBackground.withOpacity(0.3)),

                                fillColor: ColorApp.background,
                                filled: true,
                                hintText: "phoneNumber".tr,

                              ),
                              initialCountryCode: 'CM',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                              validator: (value){
                                if(value!.isValidNumber()){

                                }else{
                                  print("object");
                                  return "enterBirthday".tr;
                                }
                              },


                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Boutoncustom(
                              color: ColorApp.primary,
                              onPressed:  () {
                                if (_formsKey.currentState!.validate()) {
                                  _formsKey.currentState!.save();
                                  _loseFocus();
                                  EasyLoading.show(status: 'loading...');
                                  Authentification.insertuser(widget.email, widget.password, firstNameController.text, lastNameController.text, dateController.text, gender, phoneNumberController.text,context);

                                } else {}
                              },
                              text: IBMPlexSans(
                                text: 'next'.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
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
