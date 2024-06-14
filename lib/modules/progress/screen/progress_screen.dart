import 'package:flutter/material.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/core/datasource/database_provider.dart';
import 'package:yoga/modules/dialogs/dialog_add_weight.dart';
import 'package:yoga/modules/progress/widget/calculate_exercise.dart';
import 'package:yoga/modules/progress/widget/chart_weight.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  late Size size;

  List<Color> gradientColors = [
    AppColor.redOrange.withOpacity(0.05),
    AppColor.redOrange.withOpacity(0.3),
    AppColor.redOrange.withOpacity(0.7),
  ];
  void _showAddWeightDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: DialogAddWeight(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Your Progress is here!',
                      style: TextStyle(
                        fontFamily: 'GT',
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppColor.pupleBlue,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        //
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  bottom: 16,
                  left: 25,
                  right: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your progress",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        fontFamily: "GT",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _showAddWeightDialog(context);
                      },
                      splashColor: AppColor.lightGray,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColor.lightGray.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Add weight",
                          style: TextStyle(
                            color: AppColor.purpleDecor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: "GT",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              LineChartWeight(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Current",
                          style: TextStyle(
                            color: AppColor.blueDark,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontFamily: "GT",
                          ),
                        ),
                        FutureBuilder(
                          future: DatabaseProvider.db.getCurrentWeight(),
                          builder: (BuildContext context,
                              AsyncSnapshot<double> snapshot) {
                            if (snapshot.hasData) {
                              double currentWeight = snapshot.data ?? 0;
                              return Text(
                                "$currentWeight kg",
                                style: TextStyle(
                                  color: AppColor.pupleBlue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "GT",
                                ),
                              );
                            }
                            return Text(
                              "No info",
                              style: TextStyle(
                                color: AppColor.pupleBlue,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                fontFamily: "GT",
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    //max weight
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Max",
                            style: TextStyle(
                              color: AppColor.blueDark,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontFamily: "GT",
                            ),
                          ),
                          FutureBuilder(
                            future: DatabaseProvider.db.getMaxWeight(),
                            builder: (BuildContext context,
                                AsyncSnapshot<double> snapshot) {
                              if (snapshot.hasData) {
                                double maxWeight = snapshot.data ?? 0;
                                return Text(
                                  "$maxWeight kg",
                                  style: TextStyle(
                                    color: AppColor.pupleBlue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "GT",
                                  ),
                                );
                              }
                              return Text(
                                "No info",
                                style: TextStyle(
                                  color: AppColor.pupleBlue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "GT",
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    //min
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Min",
                          style: TextStyle(
                            color: AppColor.blueDark,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontFamily: "GT",
                          ),
                        ),
                        FutureBuilder(
                          future: DatabaseProvider.db.getMinWeight(),
                          builder: (BuildContext context,
                              AsyncSnapshot<double> snapshot) {
                            if (snapshot.hasData) {
                              double minWeight = snapshot.data ?? 0;
                              return Text(
                                "$minWeight kg",
                                style: TextStyle(
                                  color: AppColor.pupleBlue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "GT",
                                ),
                              );
                            }
                            return Text(
                              "No info",
                              style: TextStyle(
                                color: AppColor.pupleBlue,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                fontFamily: "GT",
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //
              // calculate all exercise
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 8,
                ),
                // height: 100,
                width: size.width - 50,
                decoration: BoxDecoration(
                    color: AppColor.reallyWhite,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.grayBlue.withOpacity(0.4),
                        blurRadius: 10,
                        offset: Offset(6, 4),
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: Text(
                        "Statistic",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "GT",
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FutureBuilder(
                            future: DatabaseProvider.db.countWorkoutCompleted(),
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    ),
                                  );

                                default:
                                  if (!snapshot.hasError) {
                                    return CalculateExercise(
                                      value: snapshot.data != null
                                          ? "${snapshot.data}"
                                          : "No info",
                                      title: "Workout",
                                    );
                                  } else {
                                    return CalculateExercise(
                                      value: "No info",
                                      title: "Workout",
                                    );
                                  }
                              }
                            }),
                        FutureBuilder(
                            future: DatabaseProvider.db.sumExerciseCompleted(),
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    ),
                                  );

                                default:
                                  if (!snapshot.hasError) {
                                    return CalculateExercise(
                                      value: snapshot.data != null
                                          ? "${snapshot.data}"
                                          : "No info",
                                      title: "Exercises",
                                    );
                                  } else {
                                    return CalculateExercise(
                                      value: "No info",
                                      title: "Exercise",
                                    );
                                  }
                              }
                            }),
                        FutureBuilder(
                            future: DatabaseProvider.db.sumTimeCompleted(),
                            builder: (BuildContext context,
                                AsyncSnapshot<double> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    ),
                                  );

                                default:
                                  if (!snapshot.hasError) {
                                    return CalculateExercise(
                                      value: snapshot.data != null
                                          ? "${snapshot.data}"
                                          : "No info",
                                      title: "Minutes",
                                    );
                                  } else {
                                    return CalculateExercise(
                                      value: "No info",
                                      title: "Minutes",
                                    );
                                  }
                              }
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
