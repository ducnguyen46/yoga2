import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/models/exercise.dart';

class DialogExercise extends StatelessWidget {
  final Exercise exercise;

  DialogExercise({Key? key, required this.exercise}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var widthDialog = size.width - 50;
    // var heghtDialog = widthDialog + 110;
    return Container(
      width: widthDialog,
      // height: heghtDialog,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColor.lightGray,
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            DialogExerciseInfo(
              widthDialog: widthDialog,
              exercise: exercise,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  AppPath.toAssetsIcons + "cancle.svg",
                  height: 23,
                  width: 23,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogExerciseInfo extends StatelessWidget {
  const DialogExerciseInfo({
    Key? key,
    required this.widthDialog,
    required this.exercise,
  }) : super(key: key);

  final double widthDialog;
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            AppPath.toAssetsExercise + "${exercise.image}.png",
            height: widthDialog,
            width: widthDialog,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: widthDialog,
          padding: EdgeInsets.fromLTRB(18, 6, 18, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${exercise.name}",
                style: TextStyle(
                  color: AppColor.purpleDecor,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  fontFamily: "GT",
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4),
                child: Text(
                  "How to perform:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: "GT",
                  ),
                ),
              ),
              Text(
                "${exercise.description}",
                style: TextStyle(
                  color: AppColor.grayBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GT",
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
