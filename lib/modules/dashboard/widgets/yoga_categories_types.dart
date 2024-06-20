import 'package:flutter/material.dart';
import 'package:yoga/models/category.dart';
import 'package:yoga/modules/dashboard/widgets/yoga_category_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    _controller.addListener(() {});
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
            'Yoga ${getTypeCategory(context, _listCategory[0].type)}',
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

  String getTypeCategory(BuildContext context, String typeOriginal) {
    switch (typeOriginal) {
      case "popular":
        return AppLocalizations.of(context)!.popular;

      case "beginners":
        return AppLocalizations.of(context)!.beginners;

      case "better_life":
        return AppLocalizations.of(context)!.better_life;

      case "stress_relax":
        return AppLocalizations.of(context)!.stress_relax;

      case "women":
        return AppLocalizations.of(context)!.women;

      case "seasons":
        return AppLocalizations.of(context)!.seasons;

      case "routines":
        return AppLocalizations.of(context)!.routines;

      default:
        return AppLocalizations.of(context)!.something_other;
    }
  }
}
