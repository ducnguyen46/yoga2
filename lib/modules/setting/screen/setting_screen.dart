import 'package:flutter/material.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/modules/setting/screen/about_us.dart';
import 'package:yoga/modules/setting/screen/language_setting.dart';
import 'package:yoga/modules/setting/screen/service_setting.dart';
import 'package:yoga/modules/setting/widgets/setting_select.dart';
import 'package:yoga/modules/setting/widgets/switch_button.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _enableNoti = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Setting',
                    style: TextStyle(
                      fontFamily: 'Victoria',
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                      color: AppColor.purpleDecor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Push notifications",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        fontFamily: "GT",
                      ),
                    ),
                    SwitchButton(
                      enable: _enableNoti,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _enableNoti = value;
                        });
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  color: AppColor.darkGray,
                  thickness: 0.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Text(
                  "More",
                  style: TextStyle(
                    color: AppColor.purpleDecor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "GT",
                  ),
                ),
              ),
              SettingSelection(
                settingName: "Language",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LanguageSetting(),
                    ),
                  );
                },
              ),
              SettingSelection(
                settingName: "About us",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AboutUsSetting(),
                    ),
                  );
                },
              ),
              SettingSelection(
                settingName: "Privacy policy",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ServiceSetting(),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
