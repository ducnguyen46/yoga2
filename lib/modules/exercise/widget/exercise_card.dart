import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/models/exercise.dart';

import '../../dialog/dialog_exercise.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    Key key,
    @required this.size,
    @required this.exercise,
  }) : super(key: key);

  final Exercise exercise;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showExerciseDialog(context, size, exercise);
      },
      child: Container(
        margin: EdgeInsets.only(top: 24, right: 4),
        width: size.width - 100,
        decoration: BoxDecoration(
            color: AppColor.reallyWhite,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 4,
                color: AppColor.grayBlue.withOpacity(0.4),
              )
            ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              width: 54,
              height: 54,
              child: Image.asset(
                AppPath.toAssetsExercise + "${exercise.image}.png",
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "${exercise.name}",
                        style: TextStyle(
                          color: AppColor.grayBlue,
                          fontFamily: "GT",
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Text(
                      "${exercise.description}",
                      style: TextStyle(
                        color: AppColor.grayBlack,
                        fontSize: 14,
                        fontFamily: "GT",
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                AppPath.toAssetsIcons + "chevron-right.svg",
                color: AppColor.grayBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showExerciseDialog(BuildContext context, Size size, Exercise exercise) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: DialogExercise(
          exercise: exercise,
        ),
      ),
    );
  }
}
