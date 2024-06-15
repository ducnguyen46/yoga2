import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';

class LanguageSetting extends StatefulWidget {
  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  int _tabSelect = 0;

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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                AppPath.toAssetsImages + "flower.svg",
                height: size.width * 1,
                width: size.width * 0.7,
              ),
            ),
            //
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 20),
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

                  ////
                  ////
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 26,
                      bottom: 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(
                            fontFamily: 'Victoria',
                            fontSize: 70,
                            fontWeight: FontWeight.w600,
                            color: AppColor.purpleDecor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _tabSelect = index;
                            });
                          },
                          child: LanguageSelect(
                              language: "english",
                              tabAt: index,
                              tabSelect: _tabSelect),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // nút OKE
            //
            Positioned(
              left: size.width / 4 + 20,
              bottom: 25,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: size.width / 2 - 40,
                  decoration: BoxDecoration(
                    color: AppColor.purpleDecor,
                    borderRadius: BorderRadius.circular(10),
                    // shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "Select",
                      style: TextStyle(
                        color: AppColor.reallyWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "GT",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelect extends StatelessWidget {
  final String language;
  final int tabAt;
  final int tabSelect;

  const LanguageSelect({
    Key? key,
    required this.language,
    required this.tabAt,
    required this.tabSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 25,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.reallyWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.grayBlue.withOpacity(0.4),
            blurRadius: 5,
            offset: Offset(1, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppPath.toAssetsFlag + "$language.svg",
                  height: 25,
                  width: 25,
                ),
              ),
              Text(
                "${language.capitalize()}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GT",
                ),
              )
            ],
          ),
          Opacity(
            opacity: tabAt == tabSelect ? 1 : 0,
            child: SvgPicture.asset(
              AppPath.toAssetsIcons + "check.svg",
              height: 24,
              width: 24,
              color: AppColor.purpleDecor,
            ),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
