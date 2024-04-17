import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mendocoti_appmobile_flutter/util/extension/string_extension.dart';

import '../../../../component/style/color.dart';
import '../../../../component/widget/bouton_custom.dart';
import '../../../../component/widget/text_ibm_plex_sans.dart';
import '../../../../model/profilusermodel.dart';
import '../../../../service/callapi/authentification/authentifaction.dart';
import '../../../../service/connection/connectionchecker.dart';
import '../../../../util/helpers/h_phonenumber.dart';
import '../../../../util/helpers/phone_number_format.dart';


class InfoUserPage extends StatefulWidget {
  const InfoUserPage({super.key});

  @override
  State<InfoUserPage> createState() => _InfoUserPageState();
}

class _InfoUserPageState extends State<InfoUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController phoneNumberController2 = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController Residence = TextEditingController();
  bool isCheck = false;
  var result;
  final FocusNode _focusFirstName = FocusNode();
  final FocusNode _focusLastName = FocusNode();
  final FocusNode _focusResidence = FocusNode();
  final FocusNode _focusPhone = FocusNode();
  final FocusNode _focusPhone2 = FocusNode();
  final FocusNode _focusDate = FocusNode();
  bool _isMen = true;


  init() {
    _isMen = _isMen = Profiluser.sessionusers!.gender!.toLowerCase() == 'm';
    if (Profiluser.sessionusers!.phone1 != null) {
      phoneNumberController.text = Profiluser.sessionusers!.phone1.toString();
    }
    if (Profiluser.sessionusers!.phone2 != null) {
      phoneNumberController2.text = Profiluser.sessionusers!.phone2!;
    }
    if (Profiluser.sessionusers!.name != null) {
      lastNameController.text = Profiluser.sessionusers!.name!;
    }
    if (Profiluser.sessionusers!.firstName != null) {
      firstNameController.text = Profiluser.sessionusers!.firstName!;
    }
    if (Profiluser.sessionusers!.residence != null) {
      Residence.text = Profiluser.sessionusers!.residence!;
    }else{
      Residence.text = "";
    }
    if (Profiluser.sessionusers!.birthDay != null) {
      dateController.text =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(Profiluser.sessionusers!.birthDay!));
    }
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  IBMPlexSans(
          text: "personalInformation".tr,
          color: ColorApp.onBackground,
          fontWeight: FontWeight.bold,
          size: 24,
        ),
      ),
          body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "msgChangeInfoUser".tr,
              style: const TextStyle(color: ColorApp.textColor2),
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              "userDetails".tr,
              style: const TextStyle(fontSize: 18),
            ),
            Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                });
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
                                });
                              }),
                        ),
                      ],
                    ),
                    TextFormField(
                      focusNode: _focusFirstName,

                      textInputAction: TextInputAction.next,
                      autofillHints: const [
                        AutofillHints.familyName,
                      ],
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
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
                        hintText: Profiluser.sessionusers!.firstName,
                        labelStyle: const TextStyle(
                            color: ColorApp.onBackground, fontSize: 14),
                      ),

                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      focusNode: _focusLastName,

                      textInputAction: TextInputAction.next,
                      autofillHints: const [
                        AutofillHints.name,
                      ],
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
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
                        hintText: Profiluser.sessionusers!.name,
                        labelStyle: const TextStyle(
                            color: ColorApp.onBackground, fontSize: 14),
                      ),

                    ),



                    const SizedBox(
                      height: 16,
                    ),


                    TextFormField(
                      focusNode: _focusDate,

                      textInputAction: TextInputAction.next,
                      autofillHints: const [
                        AutofillHints.email,
                      ],
                      controller: dateController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(

                        filled: true,
                        fillColor: ColorApp.background,
                        hintStyle: TextStyle(
                            color:
                            ColorApp.onBackground),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorApp.primary)),
                        hintText: Profiluser.sessionusers!.birthDay,
                        labelStyle: const TextStyle(
                            color: ColorApp.onBackground, fontSize: 14),
                      ),


                    ),


                    const SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      focusNode: _focusResidence,

                      textInputAction: TextInputAction.next,
                      autofillHints: const ["Cameroun"],
                      controller: Residence,
                      keyboardType: TextInputType.name,
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
                        hintText:  Residence.text,
                        labelStyle: const TextStyle(
                            color: ColorApp.onBackground, fontSize: 14),
                      ),


                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      focusNode: _focusPhone,
                      controller: phoneNumberController,
                      textInputAction: TextInputAction.done,
                      autofillHints: const ["Cameroun"],

                      keyboardType: TextInputType.name,
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
                        hintText: Profiluser.sessionusers!.phone1,
                        labelStyle: const TextStyle(
                            color: ColorApp.onBackground, fontSize: 14),
                      ),


                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      focusNode: _focusPhone2,
                      controller: phoneNumberController2,
                      textInputAction: TextInputAction.done,


                      keyboardType: TextInputType.name,
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
                        hintText: Profiluser.sessionusers!.phone2.isNullOrEmpty?'phoneNumber'.tr:Profiluser.sessionusers!.phone2!,
                        labelStyle: const TextStyle(
                            color: ColorApp.onBackground, fontSize: 14),
                      ),


                    ),





                    const SizedBox(
                      height: 20,
                    ),
                    /* InkWell(
                      onTap: () {
                        //Navigator.of(context).pushNamed(Routes.changePassword2);
                      },
                      child: Text(
                        context.l10n.updatePassword,
                        style: const TextStyle(
                            color: ColorApp.primary, fontSize: 18),
                      )),*/
                    Boutoncustom(
                      color: ColorApp.primary,
                      onPressed: ()async {

                        EasyLoading.show(status: 'loading...');
                        if (_formKey.currentState!
                            .validate()) {

                          result = await Connexioncheck.checkconnection();
                          if(result==true){
                            EasyLoading.show(status: 'loading...');

                            Authentification.updateinfouser(context, lastNameController.text, Residence.text, phoneNumberController.text, firstNameController.text, phoneNumberController2.text);
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
                        text: 'update'.tr,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))
          ],
        ),
      )),
        );
  }
}
