import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';

class DialogAlert extends StatelessWidget {
  final bool isSuccess;
  final String title;
  final String subTitle;

  const DialogAlert({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.isSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 80,
      decoration: BoxDecoration(
        color: AppColor.smokeWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  bottom: 15,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "$title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "GT",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  "$subTitle",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "GT",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  height: 54,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.purpleDecor.withOpacity(0.7),
                  ),
                  child: Center(
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: -40,
            left: (size.width - 80) / 2 - 40,
            child: SvgPicture.asset(
              AppPath.toAssetsIcons +
                  (isSuccess ? "check_ok.svg" : "error.svg"),
            ),
            height: 80,
            width: 80,
          ),
        ],
      ),
    );
  }
}
