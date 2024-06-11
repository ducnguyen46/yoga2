import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/models/catagory.dart';
import 'package:yoga/modules/exercise/screen/exercise_list_screen.dart';

class YogaCategoryCardGridView extends StatelessWidget {
  final Category category;

  const YogaCategoryCardGridView({Key? key, required this.category})
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
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.reallyWhite,
          boxShadow: [
            BoxShadow(
              color: AppColor.grayBlue.withOpacity(0.2),
              offset: Offset(4, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                AppPath.toAssetsCategoryCard + '${category.image}',
                height: 115,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
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
                        padding:
                        const EdgeInsets.only(left: 7, right: 7),
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

                  //
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppPath.toAssetsIcons + 'burn.svg',
                        semanticsLabel: 'Burn',
                        height: 20,
                        width: 20,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 7, right: 7),
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
            )
          ],
        ),
      ),
    );
  }
}
