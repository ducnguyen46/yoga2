import 'package:flutter/material.dart';
import 'package:yoga/models/catagory.dart';
import 'package:yoga/modules/dashboard/widgets/yoga_category_card.dart';

class ListYogaCategoryType extends StatefulWidget {
  final String type;
  final List<Category> listCategory;

  const ListYogaCategoryType({Key key, this.type, this.listCategory})
      : super(key: key);

  @override
  _ListYogaCategoryTypeState createState() => _ListYogaCategoryTypeState();
}

class _ListYogaCategoryTypeState extends State<ListYogaCategoryType> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      print('Offset: ' + _controller.offset.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ListYogaCategory(
      size: size,
      controller: _controller,
      listCategory: widget.listCategory,
      type: widget.type,
    );
  }
}

class ListYogaCategory extends StatelessWidget {
  const ListYogaCategory({
    Key key,
    @required this.size,
    @required ScrollController controller,
    @required List<Category> listCategory,
    @required String type,
  })  : _controller = controller,
        _listCategory = listCategory,
        _type = type,
        super(key: key);

  final Size size;
  final ScrollController _controller;
  final List<Category> _listCategory;
  final String _type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Yoga ${getTypeCategory(_type)}',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'GT',
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 12),
            width: size.width,
            // color: Colors.blueAccent,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: _listCategory.length,
              itemBuilder: (context, index) {
                print('at: ' + index.toString());
                return YogaCategoryCard(
                  category: _listCategory[index],
                );
              },
            ),
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
        return "women";

      case "seasons":
        return "Seasons";

      case "rountlnes":
        return "Rountlnes";

      default:
        return "Something wrong";
    }
  }
}
