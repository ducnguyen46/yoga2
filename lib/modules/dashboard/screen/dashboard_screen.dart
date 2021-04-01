import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/modules/dashboard/widgets/list_yoga_category_type.dart';
import 'package:yoga/modules/flashscreen/screen/testcategory.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.smokeWhite,
        ),
        child: SafeArea(
          child:
              // TestCategory()
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('on tap');
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
                        child: SvgPicture.asset(
                            AppPath.toAssetsIcons + 'menu.svg'),
                      ),
                    ),
                  ],
                ),
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
                      print(listType.data);
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
                                    listCategory: listCategoryByType.data,
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
          ),
        ),
      ),
    );
  }

  void getTypeCate() async {}
}
