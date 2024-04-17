import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mendocoti_appmobile_flutter/view/Authentification/loginpage.dart';


import 'package:pinput/pinput.dart';


import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../component/style/color.dart';
import '../../../component/widget/bouton_custom.dart';
import '../../../component/widget/footerpage.dart';
import '../../../component/widget/text_ibm_plex_sans.dart';
import '../../../service/callapi/authentification/authentifaction.dart';
import '../../../util/helpers/regex_format.dart';




class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  int index = 0;
  String pins = "0";
  bool good =false;
  bool see =false;
  bool writ1 =false;
  bool writ2 =false;
  bool load =true;
  bool completepin =false;
  bool obscuretext =false;
  String token ="";
  bool _osbcutext = true;
  bool _press = true;

  TextEditingController email = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController pincheck = TextEditingController();

  sendemail()async{
    var data = await Authentification.sendemail(email.text);
    if(data!=null){
      print("data");
      print(data);
      print("data");
      if(data=="true"){
        setState(() {
          index=1;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Veuiller Consulter votre adresse Email")));

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Aucun compte ne correspond à cette adresse Email.")));
      }

    }else{
      print("pas de reponse");
    }


    // if(data!=null){
    //
    //
    //
    //   setState(() {
    //     see = true;
    //     index = 1;
    //   });
    // }


  }
  sendpin(pins)async{
    print("checkpin");
    EasyLoading.show();
    var data =await Authentification.checkpin(context,pins);
    if(data!=null){
      print(data);
      if(data==true){
        print(data);
        setState(() {
          token=pins;
          good=true;
          index =2;
        });
      }
    }

  }
  reset()async{
    EasyLoading.show();
    print("checkpass");var data =await Authentification.resetpassword(context,newpassword.text,token);

  }


  // forgotpass()async{
  //   print("sendtext");
  //   print(token);
  //   var data = await EndPointActor.forgotpassword(context,token,confirmpassword.text);
  //   if(data!=null){
  //     if(data["success"]==true){
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //               backgroundColor: Colors.green,
  //               content: Text("Mot de passe mit à jour avec succès")));
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
  //
  //     }else{
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //               backgroundColor: Colors.red,
  //               content: Text("echec de mise à jour avec succès")));
  //
  //     }
  //   }
  //
  //   print(data);
  //
  //   // if(data!=null){
  //   //   if (data["success"] ==true) {
  //   //     setState(() {
  //   //       good=true;
  //   //     });
  //   //     SnackBar(
  //   //         backgroundColor: Colors.grey,
  //   //         content: Text("Operation Reussie"));
  //   //     Navigator.pop(context);
  //   //   }
  //   //   else {
  //   //     ScaffoldMessenger.of(context).showSnackBar(
  //   //         const SnackBar(
  //   //             backgroundColor: Colors.red,
  //   //             content: Text("probleme survenue")));
  //   //   }
  //   // }
  //
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IBMPlexSans(
                  text: "Vous avez oublié votre mot de passe?",
                  size: 22.sp.px,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: IBMPlexSans(
                    text:
                    "Veuillez entrer l’adresse qui recevoir le mail de reinitialisation de votre mot de passe",
                    size: 12,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    color: Color(0xff5D5D5D),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),

                TextFormField(

                  textInputAction: TextInputAction.next,
                  autofillHints: const [
                    AutofillHints.email,
                  ],
                  controller: email,
                  keyboardType: TextInputType.emailAddress,

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
                  onChanged: (value){
                    if(value.isNotEmpty){
                     setState(() {
                       writ1=true;
                     });
                    }else{
                      setState(() {
                        writ1=false;
                      });
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {

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
                  height: 3.h,
                ),
                Boutoncustom(onPressed: writ1==false?null:() {
                  EasyLoading.show();

                  Timer(Duration(milliseconds: 400),(){
                    EasyLoading.dismiss();
                  });
                  sendemail();
                }, color: ColorApp.primary,text: IBMPlexSans(text: "send".tr,color: Colors.white,fontWeight: FontWeight.w600,),)

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IBMPlexSans(
                  text: "Vérification de l'adresse E-mail",
                  size: 22.sp.px,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                      "Il semblerait que vous ayez perdu votre mot de passe. Un code a été envoyé à l'adresse E-mail ",
                      style: TextStyle(color: Color(0xff5D5D5D), fontSize: 14),
                      children: [
                        if(email.text!=null)
                          TextSpan(
                              text:  " ",
                              style: TextStyle(
                                  color: Color(0xff5D5D5D),
                                  fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                            "Veuillez insérer le code pour la réinitialisation de votre mot de passe ",
                            style: TextStyle(
                                color: Color(0xff5D5D5D),
                                fontWeight: FontWeight.w400)),
                      ]),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Pinput(
                    controller: pincheck,


                    defaultPinTheme: PinTheme(

                      width: 48,
                      height: 48,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        color: ColorApp.primary.withOpacity(0.1),
                        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
                        borderRadius: BorderRadius.circular(12),
                      ),),

                    keyboardType: TextInputType.number,
                    onTap: () {
                      print("ok");
                      pincheck.addListener(() {
                        if(pincheck.text.length!=5){
                          setState(() {
                            good=false;
                            completepin =false;
                          });
                        }
                      });

                    },
                    length: 5,
                    onCompleted: (pin) {
                      pins = pin;
                      setState(() {
                        completepin =true;
                      });

                      // sendpin(pin);
                      print(pins);

                    } ,
                  ),
                ),

                // IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),

                SizedBox(
                  height: 2.h,
                ),
                Boutoncustom(onPressed: completepin==false?null:() {
                  sendpin(pins);
                }, color: ColorApp.primary,
                text: IBMPlexSans(text: "send".tr,color: Colors.white,fontWeight: FontWeight.w600,),),

                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: IBMPlexSans(
                    text: "dontreceivecode".tr,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    color: Colors.black,
                    size: 14,

                  ),
                ),
                GestureDetector(
                    onTap: (){
                      sendemail();

                    },
                    child: see==false?IBMPlexSans(
                      text: 'resend'.tr,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      color: ColorApp.primary,

                    ): CircularProgressIndicator(color: ColorApp.primary,)
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                shrinkWrap: true,

                children: [
                  IBMPlexSans(
                    text: 'resetpassword'.tr,
                    size: 22.sp.px,

                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  IBMPlexSans(
                    text:
                    "Pour bien choisir un mot de passe, éviter de faire choix à partir de :\n - votre noms ou de ceux de vos proches \n - votre date de naissance ou de ceux de vos proche",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff5D5D5D),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  IBMPlexSans(
                    text:
                    "Votre mot de passe doit être composé d'au moins 8 caractères contenant des lettres minuscules, majuscules, des chiffres et des caractères spéciaux",
                    size: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5D5D5D),
                  ),
                  SizedBox(
                    height: 36,
                  ),

                  TextFormField(

                    textInputAction: TextInputAction.done,
                    autofillHints: const [
                      AutofillHints.password,
                    ],
                    controller: newpassword,
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


                  SizedBox(
                    height: 3.h,
                  ),


                  TextFormField(

                    textInputAction: TextInputAction.done,
                    autofillHints: const [
                      AutofillHints.password,
                    ],
                    controller: confirmpassword,
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




                  SizedBox(
                    height: 4.h,
                  ),
                  Boutoncustom(onPressed: writ1==false?null:() {
                    reset();
                  }, color: ColorApp.primary,
                  text: IBMPlexSans(text: "send".tr,color: Colors.white,fontWeight: FontWeight.w600,),)


                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

