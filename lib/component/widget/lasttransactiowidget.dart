import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../../util/helpers/regex_format.dart';

import '../../model/lasttransactionmodel.dart';
import '../style/color.dart';

class LastTransaction extends StatelessWidget {

  final Color leftcolor;
  final Color expandcolor;
  final Item transaction;


  LastTransaction({super.key,
    this.expandcolor = ColorApp.background,
    this.leftcolor = ColorApp.secondary, required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    String? projectName = transaction.tontine!.name.toString();
    String? amount = RegexFormat.moneyFormat(
        transaction.amount
            .toString());
    String? typeStructure = transaction.tontine!.association!.name.toString();
    return Container(

      color: leftcolor,
      margin: const EdgeInsets.only(
          bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: 2.w,
          ),
          Expanded(
              child: Container(
                  padding:
                  const EdgeInsets
                      .all(10),
                  color: expandcolor,
                  child: Row(children: [

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Row(children: [
                          Text(
                            amount??'',
                            style:  TextStyle(
                                fontSize:
                                18.px,
                                color: ColorApp
                                    .secondary,
                                height: 0,
                                fontWeight:
                                FontWeight.w700),
                          ),
                          const Text(
                            '   Fcfa',
                            style: TextStyle(
                                color: ColorApp
                                    .textColor2,
                                fontSize:
                                12,
                                fontStyle:
                                FontStyle.italic),
                          )
                        ]),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'projet : ${projectName}',
                          style:
                          const TextStyle(
                            fontSize:
                            14,
                            color: ColorApp
                                .secondary,
                          ),
                        ),
                        Text(
                          typeStructure?.toString()??"",
                          style: TextStyle(
                              fontSize:
                              12,
                              color: ColorApp
                                  .textColor2,
                              fontStyle:
                              FontStyle
                                  .italic),
                        ),
                      ],
                    ),
                  ]))),
        ],
      ),
    );
  }
}
