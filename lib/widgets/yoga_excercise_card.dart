import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';

class YogaExcersiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 263,
      margin: EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.green,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                AppPath.toAssetsImages + 'lockscreen.png',
                width: 204,
                height: 171,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 204,
              height: 89,
              color: AppColor.reallyWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sync Yoga',
                          style: TextStyle(
                            color: AppColor.blueDark,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'GT',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        //
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppPath.toAssetsIcons + 'clock.svg',
                                semanticsLabel: 'Clock',
                                height: 20,
                                width: 20,
                                color: AppColor.purpleDecor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Text(
                                  '7 minutes',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'GT',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppPath.toAssetsIcons + 'burn.svg',
                              semanticsLabel: 'Burn',
                              height: 20,
                              width: 20,
                              color: AppColor.purpleDecor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                '14 exercises',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'GT',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Start Button
                  InkWell(
                    onTap: () => print('Tap tap'),
                    splashColor: AppColor.blueDark.withOpacity(0.8),
                    child: Container(
                      margin: EdgeInsets.all(7),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColor.purpleDecor,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GT',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
