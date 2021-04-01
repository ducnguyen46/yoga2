import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/modules/exercise/widget/exercise_card.dart';

class ExerciseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColor.smokeWhite,
        ),
        child: SafeArea(
          top: true,
          child: Column(
            children: [
              // header
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                    Container(
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
                          AppPath.toAssetsIcons + "like_outline.svg",
                          color: AppColor.blueDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26, bottom: 8),
                child: Center(
                  child: Text(
                    "White Heat Yoga",
                    style: TextStyle(
                      fontSize: 70,
                      fontFamily: "Victoria",
                      fontWeight: FontWeight.w600,
                      color: AppColor.purpleDecor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(
                              AppPath.toAssetsIcons + "clock.svg",
                              color: AppColor.purpleDecor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "7 minutes",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "GT",
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              AppPath.toAssetsIcons + 'burn.svg',
                              semanticsLabel: 'Burn',
                              color: AppColor.grayBlue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              '14 exercises',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: 'GT',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //end header
              //
              //start card
              ExerciseCard(size: size),
              ExerciseCard(size: size),
              ExerciseCard(size: size),
              ExerciseCard(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
