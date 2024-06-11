import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';

class SettingSelection extends StatelessWidget {
  final String settingName;
  final Function()? onTap;

  const SettingSelection({
    Key? key,
    required this.settingName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.grayBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$settingName",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GT",
                ),
              ),
              SvgPicture.asset(
                AppPath.toAssetsIcons + "chevron-right.svg",
                height: 24,
                width: 24,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
