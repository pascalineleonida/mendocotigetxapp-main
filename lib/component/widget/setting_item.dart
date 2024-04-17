import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../style/color.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.onTap,
    required this.title,
    this.subtitle,
    this.assetImage = '',
    this.iconData,
  });
  final String title, assetImage;
  final void Function() onTap;
  final String? subtitle;
  final Icon? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.15,
          ),
          child: const Divider(
            color: ColorApp.textColor2,
            height: 1,
          ),
        ),
        ListTile(
          leading: iconData ??
              SvgPicture.asset(
                assetImage,
                height: 22,
                width: 22,
              ),
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
            subtitle!,
            style: const TextStyle(
              fontSize: 12,
              color: ColorApp.textColor2,
            ),
          )
              : const SizedBox(),
        ),
      ],
    );
  }
}
