import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';

// ignore: must_be_immutable
class AboutUsSetting extends StatelessWidget {
  String _aboutUs = "Hi there";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColor.smokeWhite,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.smokeWhite,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.grayBlue.withOpacity(0.4),
                                offset: Offset(5, 5),
                                blurRadius: 30,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: SvgPicture.asset(
                            AppPath.toAssetsIcons + "corner-up-left.svg",
                            color: AppColor.blueDark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "About us",
                style: TextStyle(
                  color: AppColor.grayBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontFamily: "GT",
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    _aboutUs,
                    style: TextStyle(
                      color: AppColor.grayBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "GT",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
