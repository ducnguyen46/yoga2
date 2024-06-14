import 'package:flutter/material.dart';
import 'package:yoga/models/category.dart';
import 'package:yoga/modules/dashboard/widgets/yoga_category_card.dart';

class YogaCategoriesTypes extends StatefulWidget {
  final List<Category> listCategory;

  const YogaCategoriesTypes({Key? key, required this.listCategory})
      : super(key: key);

  @override
  _YogaCategoriesTypesState createState() => _YogaCategoriesTypesState();
}

class _YogaCategoriesTypesState extends State<YogaCategoriesTypes> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      // print('Offset: ' + _controller.offset.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YogaCategory(
      controller: _controller,
      listCategory: widget.listCategory,
    );
  }
}

class YogaCategory extends StatelessWidget {
  const YogaCategory({
    Key? key,
    required ScrollController controller,
    required List<Category> listCategory,
  })  : _controller = controller,
        _listCategory = listCategory,
        super(key: key);

  final ScrollController _controller;
  final List<Category> _listCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            'Yoga ${getTypeCategory(_listCategory[0].type)}',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'GT',
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 25,
            ),
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: _listCategory.length,
            itemBuilder: (context, index) {
              return YogaCategoryCard(
                category: _listCategory[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                width: 16,
              );
            },
          ),
        )
      ],
    );
  }

  String getTypeCategory(String typeOriginal) {
    switch (typeOriginal) {
      case "popular":
        return "Popular";

      case "beginners":
        return "Beginners";

      case "better_life":
        return "Better Life";

      case "stress_relax":
        return "Stress Relax";

      case "women":
        return "Women";

      case "seasons":
        return "Seasons";

      case "routines":
        return "Routines";

      default:
        return "Something other";
    }
  }
}
