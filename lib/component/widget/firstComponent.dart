import 'package:flutter/material.dart';
class parametre extends StatelessWidget {
  IconData?icon;
  String? nom;
  String? mail;
  String? code;
  IconData?icone;
  String? name;
  String? email;
  parametre({super.key,this.icon,this.nom,this.mail,this.code,this.email,this.icone,this.name});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(icon,size: 80,),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Text(nom.toString(),style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50,top: 5),
                      child: Text(mail.toString(),style: TextStyle(fontWeight: FontWeight.w200,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,right: 100),
                      child: Text(code.toString(),style: TextStyle(fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),

              ],
            ),
            Divider(
              height: 50,
              indent: 15,
              endIndent: 10,
              color: Color(0xffE2E8F0),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(icone,size: 30,color: Colors.grey.shade500),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,bottom: 10),
                  child: Column(
                    children: [
                      Text(name.toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.only(right: 65),
                        child: Text(email.toString(),style: TextStyle(fontWeight: FontWeight.w300)),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
