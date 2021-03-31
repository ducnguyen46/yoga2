import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/widgets/list_yoga_exercise.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.smokeWhite,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('on tap');
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.smokeWhite,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.grayBlue.withOpacity(0.4),
                              offset: Offset(5, 5),
                              blurRadius: 30,
                            )
                          ],
                        ),
                        child: SvgPicture.asset(
                            AppPath.toAssetsIcons + 'menu.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yoga',
                          style: TextStyle(
                            fontFamily: 'Victoria',
                            fontSize: 65,
                            fontWeight: FontWeight.w600,
                            color: AppColor.purpleDecor,
                          ),
                        ),
                        Text(
                          'Find your Yoga exercise today.',
                          style: TextStyle(
                            fontFamily: 'GT',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppColor.pupleBlue,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 336,
                width: size.width,
                margin: EdgeInsets.only(top: 40),
                color: Colors.amber,
                child: ListYogaExercise(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
