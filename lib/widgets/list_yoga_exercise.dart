import 'package:flutter/material.dart';

import 'yoga_excercise_card.dart';

class ListYogaExercise extends StatefulWidget {
  @override
  _ListYogaExerciseState createState() => _ListYogaExerciseState();
}

class _ListYogaExerciseState extends State<ListYogaExercise> {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Yoga Popular',
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
            color: Colors.blueAccent,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                print('at: ' + index.toString());
                return YogaExcersiceCard();
              },
            ),
          ),
        )
      ],
    );
  }
}
