import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/modules/rountine/widgets/like_exercise_page.dart';
import 'package:yoga/modules/rountine/widgets/rountine_page.dart';

class RountineScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
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
                    'Yoga App',
                    style: TextStyle(
                      fontFamily: 'Victoria',
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                      color: AppColor.purpleDecor,
                    ),
                  ),
                  Text(
                    'Your Rountines and your exercises are here!',
                    style: TextStyle(
                      fontFamily: 'GT',
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColor.pupleBlue,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 6,
                dotColor: AppColor.circleGradient1.withOpacity(0.6),
                activeDotColor: AppColor.purpleDecor,
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: [
              RountinePage(),
              ExerciseLikedPage(),
            ],
          ),
        ),
      ],
    );
  }
}
