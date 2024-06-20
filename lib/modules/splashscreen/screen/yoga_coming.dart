import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/modules/dashboard/screen/dashboard_screen.dart';
import 'package:yoga/modules/splashscreen/screen/welcome_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class YogaComing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if (!snapshot.hasError) {
                return snapshot.data?.getBool("Opened") != null
                    ? DashboardScreen()
                    : WelcomeScreen();
              } else {
                return Text(AppLocalizations.of(context)!.something_other);
              }
          }
        },
      ),
    );
  }
}
