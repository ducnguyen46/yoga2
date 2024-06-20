import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.smokeWhite,
      body: Stack(
        children: <Widget>[
          // Default flower background color
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              AppPath.toAssetsImages + "flower.svg",
              height: size.width * 1,
              width: size.width * 0.7,
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
