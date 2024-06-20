import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yoga/extensions/app_extension.dart';
import 'package:yoga/models/language_set.dart';
import 'package:yoga/modules/app_language/cubit/app_language_cubit.dart';

class LanguageSetting extends StatefulWidget {
  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  int _tabSelect = 0;

  final langs = [
    LanguageSet(
      language: "English",
      image: "english",
      languageCode: "en",
    ),
    LanguageSet(
      language: "France",
      image: "france",
      languageCode: "fr",
    ),
    LanguageSet(
      language: "Italia",
      image: "italy",
      languageCode: "it",
    ),
    LanguageSet(
      language: "Portugal",
      image: "portugal",
      languageCode: "pt",
    ),
    LanguageSet(
      language: "Россия",
      image: "russia",
      languageCode: "ru",
    ),
  ];

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
                          AppLocalizations.of(context)!.language,
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
                      itemCount: langs.length,
                      itemBuilder: (context, index) {
                        final lang = langs[index];
                        return GestureDetector(
                          onTap: () {
                            changeLanguage(context, index, lang.languageCode);
                          },
                          child: LanguageSelect(
                              language: lang.language.hardCode,
                              image: lang.image,
                              tabAt: index,
                              tabSelect: _tabSelect),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> changeLanguage(
      BuildContext context, int index, String languageCode) async {
    final _languageCubit = context.read<AppLanguageCubit>();
    _languageCubit.changeLanguage(context, languageCode);
    setState(() {
      _tabSelect = index;
    });
  }
}

class LanguageSelect extends StatelessWidget {
  final String image;
  final String language;
  final int tabAt;
  final int tabSelect;

  const LanguageSelect({
    Key? key,
    required this.language,
    required this.image,
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
                  AppPath.toAssetsFlag + "$image.svg",
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
