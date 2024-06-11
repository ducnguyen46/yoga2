import 'package:flutter/material.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/modules/dashboard/widgets/list_yoga_category_type.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
                List<String> list = listType.data!;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                      future:
                          DatabaseProvider.db.getCategoryByType(list[index]),
                      builder: (context, listCategoryByType) {
                        if (listCategoryByType.hasData) {
                          //truyen vao listCategory
                          return Container(
                            height: 309,
                            width: size.width,
                            margin: EdgeInsets.only(top: 40),
                            child: ListYogaCategoryType(
                              type: list[index],
                              listCategory: listCategoryByType.data!,
                            ),
                          );
                        } else {
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
