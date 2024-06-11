import 'package:flutter/material.dart';
import 'package:yoga/constants/app_color.dart';

class CalculateExercise extends StatelessWidget {
  final String title;
  final String value;

  const CalculateExercise({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: Text(
            "$value",
            style: TextStyle(
              color: AppColor.blueDark,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: "GT",
            ),
          ),
        ),
        Text(
          "$title",
          style: TextStyle(
            color: AppColor.pupleBlue,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "GT",
          ),
        ),
      ],
    );
  }
}
