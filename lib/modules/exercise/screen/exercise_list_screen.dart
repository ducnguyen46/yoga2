import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/models/catagory.dart';
import 'package:yoga/models/exercise.dart';
import 'package:yoga/modules/exercise/screen/exercise_screen.dart';
import 'package:yoga/modules/exercise/widget/exercise_card.dart';

class ExerciseListScreen extends StatefulWidget {
  final Category category;

  const ExerciseListScreen({Key key, this.category}) : super(key: key);
  @override
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  bool likeExercise = false;
  bool like = false;
  List<Exercise> listExercise = [];

  Widget notLike = SvgPicture.asset(
    AppPath.toAssetsIcons + "like_outline.svg",
    color: AppColor.blueDark,
  );

  Widget liked = SvgPicture.asset(
    AppPath.toAssetsIcons + "like.svg",
    color: AppColor.purpleDecor,
  );

  void checkMark() {
    DatabaseProvider.db.categoryMarked(widget.category.namefit).then(
      (value) {
        setState(() {
          like = value;
        });
        print(value);
      },
      onError: (error) {
        print(error);
      },
    );
  }

  void markAndUnmark(bool like) async {
    DatabaseProvider.db.markCategory(widget.category.namefit, like).then(
        (value) {
      print(value);
    }, onError: (error) {
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    checkMark();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // header
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.smokeWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.grayBlue.withOpacity(0.4),
                                    offset: Offset(5, 5),
                                    blurRadius: 30,
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: SvgPicture.asset(
                                AppPath.toAssetsIcons + "corner-up-left.svg",
                                color: AppColor.blueDark,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              likeExercise = !likeExercise;
                            });
                            markAndUnmark(likeExercise);
                            checkMark();
                          },
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.smokeWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.grayBlue.withOpacity(0.4),
                                    offset: Offset(5, 5),
                                    blurRadius: 30,
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: like ? liked : notLike,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26, bottom: 8),
                    child: Center(
                      child: Text(
                        "${widget.category.name}",
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: "Victoria",
                          fontWeight: FontWeight.w600,
                          color: AppColor.purpleDecor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: SvgPicture.asset(
                                  AppPath.toAssetsIcons + "clock.svg",
                                  color: AppColor.purpleDecor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "${widget.category.count / 2} minutes",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "GT",
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                  AppPath.toAssetsIcons + 'burn.svg',
                                  semanticsLabel: 'Burn',
                                  color: AppColor.grayBlue,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Text(
                                  '${widget.category.count} exercises',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontFamily: 'GT',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //end header
                  //
                  //start card
                  //
                  Expanded(
                    child: FutureBuilder(
                      future: DatabaseProvider.db
                          .getExerciseFromCategory(widget.category),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Exercise>> exercises) {
                        if (exercises.hasData) {
                          listExercise = exercises.data;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: ListView.builder(
                              itemCount: exercises.data.length,
                              itemBuilder: (context, index) {
                                return ExerciseCard(
                                    size: size,
                                    exercise: exercises.data[index]);
                              },
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            //Button start
            Positioned(
              left: size.width / 4 + 20,
              bottom: 25,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExerciseScreen(
                        listExercise: listExercise,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: size.width / 2 - 40,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColor.purpleDecor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Start",
                      style: TextStyle(
                        color: AppColor.reallyWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "GT",
                      ),
                    ),
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
