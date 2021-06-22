import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/models/catagory.dart';
import 'package:yoga/models/exercise.dart';
import 'package:yoga/models/exercise_completed.dart';
import 'package:yoga/models/exercise_completed.dart';
import 'package:yoga/modules/exercise/widget/countdown.dart';
import 'package:yoga/modules/exercise/widget/video_player.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../constants/app_path.dart';
import '../widget/video_player.dart';

class ExerciseScreen extends StatefulWidget {
  final Category category;
  final List<Exercise> listExercise;

  const ExerciseScreen({
    Key key,
    @required this.category,
    @required this.listExercise,
  }) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //
      Provider.of<Countdown>(context, listen: false)
          .setLengthExercise(widget.listExercise.length);
      //
      Provider.of<Countdown>(context, listen: false).countdownTime();
    });
    super.initState();
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
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              //
              Column(
                children: [
                  // header
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 10,
                      bottom: 10,
                    ),
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 40,
                            bottom: 24,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(4, 6),
                                  blurRadius: 6,
                                  color: AppColor.grayBlue.withOpacity(0.2),
                                )
                              ],
                            ),
                            child: ExerciseVideoPlayer(
                              videoName: widget
                                  .listExercise[
                                      context.watch<Countdown>().getIndex]
                                  .image,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 4,
                            bottom: 24,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${widget.listExercise[context.read<Countdown>().getIndex].name}",
                                style: TextStyle(
                                  color: AppColor.purpleDecor,
                                  fontSize: 19,
                                  fontFamily: "GT",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${widget.listExercise[context.read<Countdown>().getIndex].description}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "GT",
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 200,
                          lineWidth: 20,
                          percent: (context.read<Countdown>().getTime / 30),
                          backgroundColor:
                              AppColor.circleGradient2.withOpacity(0.2),
                          progressColor: AppColor.circleGradient1,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            (context.read<Countdown>().getTime < 10)
                                ? "0${context.watch<Countdown>().getTime}"
                                : "${context.watch<Countdown>().getTime}",
                            style: TextStyle(
                              color: AppColor.blueDark,
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              (Provider.of<Countdown>(context).getTime == 0 &&
                      Provider.of<Countdown>(context).getIndex ==
                          widget.listExercise.length - 1)
                  ? Positioned(
                      left: 20,
                      right: 20,
                      bottom: 25,
                      child: InkWell(
                        onTap: () async {
                          ExerciseCompleted excerciseCompleted =
                              ExerciseCompleted.init();
                          excerciseCompleted.namefit = widget.category.namefit;
                          excerciseCompleted.timeCount =
                              widget.category.count / 2;
                          excerciseCompleted.exerciseCount =
                              widget.category.count;

                          await DatabaseProvider.db
                              .addUpdateExcerciseCompleted(excerciseCompleted);

                          Navigator.pop(context);
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
                              "Done",
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
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
