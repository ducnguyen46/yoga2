import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';

class BackgroundMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background();
  }
}

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.blueDark,
      ),
      // child: Transform.rotate(
      //   angle: math.pi * 28 * 180,
      //   child: SvgPicture.asset(
      //     AppPath.toAssetsImages + 'flower.svg',
      //     semanticsLabel: 'Flower in top right',
      //     height: 300,
      //     width: 300,
      //   ),
      // ),
      child: Image.asset('assets/images/flower.png'),
    );
  }
}
