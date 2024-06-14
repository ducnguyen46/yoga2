import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:yoga/modules/progress/screen/progress_screen.dart';
import 'package:yoga/modules/rountine/screen/routine_screen.dart';
import 'package:yoga/modules/setting/screen/setting_screen.dart';

import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 200);
  late AnimationController _controller;

  List<MenuTab> menuTabs = [
    MenuTab(
      name: "Exercise",
      iconPath: AppPath.toAssetsIcons + "home.svg",
    ),
    MenuTab(
      name: "Progress",
      iconPath: AppPath.toAssetsIcons + "progress.svg",
    ),
    MenuTab(
      name: "Routine",
      iconPath: AppPath.toAssetsIcons + "workout.svg",
    ),
    MenuTab(
      name: "Setting",
      iconPath: AppPath.toAssetsIcons + "settings.svg",
    ),
  ];

  List<Widget> screens = [
    HomeScreen(),
    ProgressScreen(),
    RoutineScreen(),
    SettingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColor.smokeWhite,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                AppPath.toAssetsImages + "flower.svg",
                height: size.width * 1,
                width: size.width * 0.7,
              ),
              // child: Image.asset(AppPath.toAssetsImages + "flower.png"),
            ),
            //
            //man hinh
            BlocBuilder<DashboardCubit, DashboardState>(
              buildWhen: (previous, current) =>
                  previous.isShowMenu != current.isShowMenu,
              builder: (context, state) {
                return AnimatedPositioned(
                  top: 0,
                  bottom: 0,
                  left: state.isShowMenu ? 100 : 0,
                  right: state.isShowMenu ? -100 : 0,
                  duration: duration,
                  // man hinh chinh
                  child: BlocBuilder<DashboardCubit, DashboardState>(
                    buildWhen: (previous, current) =>
                        previous.tabActive != current.tabActive,
                    builder: (context, state) {
                      return SafeArea(
                        bottom: false,
                        child: screens[state.tabActive],
                      );
                    },
                  ),
                );
              },
            ),

            // menu
            BlocBuilder<DashboardCubit, DashboardState>(
              buildWhen: (previous, current) =>
                  previous.isShowMenu != current.isShowMenu,
              builder: (context, state) {
                return AnimatedPositioned(
                  top: 0,
                  bottom: 0,
                  left: state.isShowMenu ? 0 : -100,
                  right: state.isShowMenu ? size.width - 100 : size.width,
                  duration: duration,
                  child: SafeArea(
                    child: Container(
                      height: size.height,
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (MenuTab tab in menuTabs)
                            GestureDetector(
                              onTap: () {
                                final dashboardCubit =
                                    context.read<DashboardCubit>();
                                dashboardCubit.selectTab(menuTabs.indexOf(tab));
                              },
                              child: MenuTabWidget(
                                menuTab: tab,
                                tabAt: menuTabs.indexOf(tab),
                                tabActive: state.tabActive,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            //show menu button
            Positioned(
              left: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: Row(
                    children: [
                      BlocBuilder<DashboardCubit, DashboardState>(
                        buildWhen: (previous, current) =>
                            previous.isShowMenu != current.isShowMenu,
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              context.read<DashboardCubit>().tapDrawer();
                              if (state.isShowMenu) {
                                _controller.reverse();
                              } else {
                                _controller.forward();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.smokeWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.grayBlue.withOpacity(0.4),
                                    offset: Offset(5, 5),
                                    blurRadius: 30,
                                  )
                                ],
                              ),
                              child: SvgPicture.asset(state.isShowMenu
                                  ? AppPath.toAssetsIcons + "cancle.svg"
                                  : AppPath.toAssetsIcons + 'menu.svg'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuTabWidget extends StatelessWidget {
  MenuTabWidget({
    Key? key,
    required this.menuTab,
    required this.tabAt,
    required this.tabActive,
  }) : super(key: key);

  final MenuTab menuTab;
  final int tabAt;
  final int tabActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      width: 70,
      height: 64,
      decoration: BoxDecoration(
        color: AppColor.reallyWhite,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 4),
            color: AppColor.grayBlue.withOpacity(0.4),
            blurRadius: 10,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              menuTab.iconPath,
              height: 24,
              width: 24,
              color: tabActive == tabAt
                  ? AppColor.purpleDecor
                  : AppColor.blueDark.withOpacity(0.8),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                menuTab.name,
                style: TextStyle(
                  color: tabActive == tabAt
                      ? AppColor.purpleDecor
                      : AppColor.blueDark.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  fontFamily: "GT",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuTab {
  String iconPath;
  String name;

  MenuTab({
    required this.name,
    required this.iconPath,
  });
}
