import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/models/catagory.dart';
import 'package:yoga/modules/exercise/screen/exercise_list_screen.dart';

class YogaCategoryCardGridView extends StatelessWidget {
  final Category category;

  const YogaCategoryCardGridView({Key key, @required this.category})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExerciseListScreen(
                      category: category,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    AppPath.toAssetsCategoryCard + '${category.image}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.reallyWhite,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.grayBlue.withOpacity(0.4),
                      offset: Offset(0, 4),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${category.name}',
                        style: TextStyle(
                          color: AppColor.blueDark,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GT',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 2),
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
                                        '${category.count / 2} minutes',
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
                                      '${category.count} exercises',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'GT',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Start Button
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => ExerciseListScreen(
                          //                   category: category,
                          //                 )));
                          //   },
                          //   splashColor: AppColor.blueDark.withOpacity(0.8),
                          //   child: Container(
                          //     padding: EdgeInsets.all(6),
                          //     decoration: BoxDecoration(
                          //       color: AppColor.purpleDecor,
                          //       borderRadius: BorderRadius.circular(9),
                          //     ),
                          //     child: Text(
                          //       'Start',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 14,
                          //         fontWeight: FontWeight.w500,
                          //         fontFamily: 'GT',
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
