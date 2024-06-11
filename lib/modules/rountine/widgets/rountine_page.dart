import 'package:flutter/material.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/models/catagory.dart';
import 'package:yoga/modules/rountine/widgets/yoga_category_card_grid.dart';

class RoutinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int gridCol = 0;
    if (size.width <= 300) {
      gridCol = 1;
    } else if (size.width <= 500 && size.width > 300) {
      gridCol = 2;
    } else if (size.width <= 720 && size.width > 500) {
      gridCol = 3;
    } else {
      gridCol = 4;
    }
    //
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: FutureBuilder(
        // lay ra cac categoryType
        future: DatabaseProvider.db.getCategoryByType("routines"), //routines
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> categories) {
          if (categories.hasData) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                    ),
                    child: Text(
                      "Your Routines",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'GT',
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCol,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return YogaCategoryCardGridView(
                        category: categories.data![index],
                      );
                    },
                    childCount: categories.data?.length,
                  ),
                ),
              ],
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
    );
  }
}
