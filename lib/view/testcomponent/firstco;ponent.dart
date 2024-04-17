import 'dart:math';

import 'package:flutter/material.dart';

import '../../component/animation/animationwidget.dart';

List DataProfil = [
  {
    'Icon': Icons.person,
    'nom': 'mabrey pascaline',
    'mail': 'passymabrey@gmail.com',
    'code': 'codes 510716237',
  },
  {
    'icone': Icons.perm_contact_cal_rounded,
    'name': 'Information personelles',
    'email': 'Information personelles',
  },
  {
    'icone': Icons.password,
    'name': 'Password',
    'email': 'Password',
  },
  {
    'IconData': Icons.list_alt,
    'nom': 'Information legales',
    'texte': 'Information legales',
  },
  {
    'IconData': Icons.add,
    'nom': 'Autres',
  },
  {
    'IconData': Icons.language,
    'nom': 'Switch to English',
  },
  {
    'IconData': Icons.question_mark,
    'nom': 'Aide & Support',
  },
  {
    'IconData': Icons.person_add_disabled,
    'nom': 'Supprimer mon compte',
  },
];

class PO extends StatefulWidget {
  const PO({super.key});

  @override
  _POState createState() => _POState();
}

class _POState extends State<PO> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Parametre'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Ici, vous pouvez gérer l'action de retour, par exemple en utilisant Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                // Row(
                //   // children: DataProfil.map((e) => parametreprofil(nom: e['nom'],mail: e['mail'],code: e['code'],icon:Icons.person,email: e['email'],name: e['nam'],icone: Icons.perm_contact_cal_rounded,)).toList(),
                // ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 20),
                        child: Image(
                          image: AssetImage('assets/images/logo.jpg'),
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text('Mabrey leonida pascaline', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff475569))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text('passymabrey@gmail.com',maxLines: 2,style: TextStyle(color: Color(0xff64748B))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Text('codes 1160564514',maxLines: 2,style: TextStyle(color: Color(0xff64748B))),
                            ),

                          ],
                        ),
                      ),
                    ],
                    // child: ListTile(
                    //   leading: LayoutBuilder(
                    // builder: (BuildContext context, BoxConstraints constraints) {
                    //   return Container(
                    //     width: 60,
                    //     height: constraints.maxHeight,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.rectangle,
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/images/logo.jpg'),
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   );
                    //
                    // }),title:  Text('Mabrey leonida pascaline',style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff475569))),subtitle:  Text('passymabrey@gmail.com \n codes 1160564514',maxLines: 2,style: TextStyle(color: Color(0xff64748B))),),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 50,
                      child: ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        leading: Icon(Icons.perm_contact_cal_rounded,
                            size: 24, color: Color(0xff64748B)),
                        title: Text('Personal Information',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff475569),
                            )),
                      ),
                    ),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Divider(
                    height: 10,
                    indent: 15,
                    endIndent: 10,
                    color: Color(0xffE2E8F0),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Container(
                    height: 50,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                      leading: Icon(Icons.password,
                          size: 24, color: Color(0xff64748B)),
                      title: Text('Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff475569),
                          )),
                    ),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Divider(
                    height: 10,
                    indent: 15,
                    endIndent: 10,
                    color: Color(0xffE2E8F0),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Container(
                    height: 50,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                      leading: Icon(Icons.list_alt,
                          size: 24, color: Color(0xff64748B)),
                      title: Text('Legal Information',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff475569),
                          )),
                    ),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Divider(
                    height: 10,
                    indent: 15,
                    endIndent: 10,
                    color: Color(0xffE2E8F0),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Container(
                    height: 50,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                      leading:
                          Icon(Icons.add, size: 24, color: Color(0xff64748B)),
                      title: Text('Other',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff475569),
                          )),
                    ),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Divider(
                    height: 10,
                    indent: 15,
                    endIndent: 10,
                    color: Color(0xffE2E8F0),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Container(
                    height: 50,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                      leading: Icon(Icons.change_circle,
                          size: 24, color: Color(0xff64748B)),
                      title: Text('Changer en Francais',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff475569),
                          )),
                    ),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Divider(
                    height: 10,
                    indent: 15,
                    endIndent: 10,
                    color: Color(0xffE2E8F0),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Container(
                    height: 50,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                      leading: Icon(Icons.help_outline,
                          size: 24, color: Color(0xff64748B)),
                      title: Text('Help & support',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff475569),
                          )),
                    ),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Divider(
                    height: 10,
                    indent: 15,
                    endIndent: 10,
                    color: Color(0xffE2E8F0),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Container(
                    height: 50,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                      leading: Icon(Icons.person_add_disabled,
                          size: 24, color: Color(0xff64748B)),
                      title: Text('Delete My account',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff475569),
                          )),
                    ),
                  ),
                ),
                Delatanimationwidget(
                  delay: DataProfil.indexOf(e) * 100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60, top: 10),
                        child: Column(
                          children: [
                            Text('Logout',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
