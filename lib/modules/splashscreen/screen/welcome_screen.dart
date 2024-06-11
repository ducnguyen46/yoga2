import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/modules/dashboard/screen/dashboard_screen.dart';
import 'package:yoga/modules/dialog/dialog_alert.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const String regex = r"^([1-9][0-9]*)(\.?)([0-9]*)$";
  late TextEditingController _weightController;
  late FocusNode _focusWeight;

  bool _letgo = false;

  Future<void> _addWeightCompleted(String value) async {
    RegExp regExpDoubleNumber = RegExp(regex);
    if (!regExpDoubleNumber.hasMatch(value)) {
      _letgo = false;
      _showAlertDialog("Hmmmm, have wrong weight?!",
          "Enter the correct number for your weight\n Ex: 50, 50.5", false);
      _focusWeight.requestFocus();
    } else {
      // _addWeightToDB(double.parse(value));
      DateTime date = DateTime.now();
      await DatabaseProvider.db.addWeight(double.parse(value), date).then(
          (result) async {
        if (result) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setBool("Opened", true);
          _letgo = true;
          _showAlertDialog(
              "Success!",
              "We just add your weight!. Have a nice day with strong body!",
              true);
        } else {
          _showAlertDialog("Hmmmm, have wrong weight?!",
              "Enter the correct number for your weight\n Ex: 50, 50.5", false);
        }
      }, onError: (error) {
        print("This is error: $error");
      });
    }
  }

  void _addWeightToDB(double weight) async {
    DateTime date = DateTime.now();
    await DatabaseProvider.db.addWeight(weight, date).then((value) {},
        onError: (error) {
      print("This is error: $error");
    });
  }

  void _showAlertDialog(String title, String subTitle, bool isSuccess) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        // backgroundColor: AppColor.grayBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: DialogAlert(
          title: title,
          subTitle: subTitle,
          isSuccess: isSuccess,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController();
    _focusWeight = FocusNode();
    _weightController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _weightController.dispose();
    _focusWeight.dispose();
  }

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
              bottom: 0,
              right: 0,
              child: RotatedBox(
                quarterTurns: 45,
                child: SvgPicture.asset(
                  AppPath.toAssetsImages + "flower.svg",
                  height: size.width * 1.5,
                  width: size.width * 1,
                ),
              ),
              // child: Image.asset(AppPath.toAssetsImages + "flower.png"),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 25,
                  ),
                  height: size.height * 0.5,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yoga App',
                        style: TextStyle(
                          fontFamily: 'Victoria',
                          fontSize: 70,
                          fontWeight: FontWeight.w600,
                          color: AppColor.purpleDecor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Yoga Mediation from Beginners and Advanced levels, exercise for weight loss and fitness.',
                          style: TextStyle(
                            fontFamily: 'GT',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColor.pupleBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: SafeArea(
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 6,
                          ),
                          width: size.width - 50,
                          decoration: BoxDecoration(
                            color: AppColor.reallyWhite,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 6),
                                blurRadius: 5,
                                color: AppColor.grayBlue.withOpacity(0.6),
                              )
                            ],
                          ),
                          child: Center(
                            child: TextField(
                              controller: _weightController,
                              autocorrect: false,
                              cursorColor:
                                  AppColor.purpleDecor.withOpacity(0.4),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.purpleDecor,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Your weight - KG",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: AppColor.purpleDecor,
                        onTap: () async {
                          await _addWeightCompleted(_weightController.text);
                          _letgo
                              ? Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DashboardScreen(),
                                  ),
                                  (route) => false,
                                )
                              : print("Cant let go!");
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: size.width - 50,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColor.purpleDecor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              "Let's go",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "GT",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
