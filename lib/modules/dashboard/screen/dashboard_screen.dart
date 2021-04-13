import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/modules/dashboard/widgets/list_yoga_category_type.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  bool _showMenu = false;

  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<Offset> _slideAnimantion;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _slideAnimantion = Tween<Offset>(begin: Offset(0, 0), end: Offset(3, 0))
        .animate(_controller);
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
        //
        //man hinh chinh
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(AppPath.toAssetsImages + "flower.png"),
            ),
            //
            //
            AnimatedPositioned(
              top: 0,
              bottom: 0,
              left: _showMenu ? 100 : 0,
              right: _showMenu ? -100 : 0,
              duration: duration,
              // man hinh chinh
              child: SafeArea(
                  bottom: false,
                  child: Column(
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
                                  'Find your Yoga exercise today.',
                                  style: TextStyle(
                                    fontFamily: 'GT',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.pupleBlue,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: FutureBuilder(
                          // lay ra cac categoryType
                          future: DatabaseProvider.db.getListCategoryType(),
                          builder: (context, listType) {
                            if (listType.hasData) {
                              // voi moi mot type, lay ra cac category
                              List<String> list = listType.data as List;
                              return ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return FutureBuilder(
                                    future: DatabaseProvider.db
                                        .getCategoryByType(list[index]),
                                    builder: (context, listCategoryByType) {
                                      if (listCategoryByType.hasData) {
                                        //truyen vao listCategory
                                        return Container(
                                          height: 336,
                                          width: size.width,
                                          margin: EdgeInsets.only(top: 40),
                                          // color: Colors.amber,
                                          child: ListYogaCategoryType(
                                            type: list[index],
                                            listCategory:
                                                listCategoryByType.data,
                                          ),
                                        );
                                      } else {
                                        print("no more category");
                                        return CircularProgressIndicator(
                                          strokeWidth: 2,
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            } else {
                              print("no more type");
                            }
                            return CircularProgressIndicator(
                              strokeWidth: 2,
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            ),

            //show menu button
            Positioned(
              left: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_showMenu) {
                              _controller.reverse();
                            } else {
                              _controller.forward();
                            }
                            _showMenu = !_showMenu;
                          });
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
                          child: SvgPicture.asset(_showMenu
                              ? AppPath.toAssetsIcons + "cancle.svg"
                              : AppPath.toAssetsIcons + 'menu.svg'),
                        ),
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
