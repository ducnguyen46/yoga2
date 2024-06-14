import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/core/repositories/app_repository_imp.dart';
import 'package:yoga/models/category.dart';
import 'package:yoga/models/exercise.dart';
import 'package:yoga/models/exercise_completed.dart';
import 'package:yoga/modules/exercise/cubit/exercise_cubit.dart';
import 'package:yoga/modules/exercise/widget/video_player.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExerciseScreen extends StatefulWidget {
  final Category category;
  final List<Exercise> exercises;

  const ExerciseScreen({
    Key? key,
    required this.category,
    required this.exercises,
  }) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<ExerciseCubit>(
      create: (context) => ExerciseCubit(
        context.read<AppRepositoryImp>(),
        widget.exercises,
      )..startWorkout(),
      child: Scaffold(
        backgroundColor: AppColor.smokeWhite,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
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
                        BlocBuilder<ExerciseCubit, ExerciseState>(
                          buildWhen: (previous, current) =>
                              previous.tick != current.tick,
                          builder: (context, state) {
                            return CircularPercentIndicator(
                              radius: 60,
                              lineWidth: 20,
                              percent: state.tick / 30,
                              backgroundColor:
                                  AppColor.circleGradient2.withOpacity(0.2),
                              progressColor: AppColor.circleGradient1,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: Text(
                                state.tick < 10
                                    ? "0${state.tick}"
                                    : "${state.tick}",
                                style: TextStyle(
                                  color: AppColor.blueDark,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                        ),
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
                            child: BlocBuilder<ExerciseCubit, ExerciseState>(
                              buildWhen: (previous, current) =>
                                  previous.countCompletedExcercise !=
                                  current.countCompletedExcercise,
                              builder: (context, state) {
                                return ExerciseVideoPlayer(
                                  videoName: widget
                                      .exercises[state.countCompletedExcercise]
                                      .image,
                                );
                              },
                            ),
                          ),
                        ),
                        BlocBuilder<ExerciseCubit, ExerciseState>(
                          buildWhen: (previous, current) =>
                              previous.countCompletedExcercise !=
                              current.countCompletedExcercise,
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 4,
                                bottom: 24,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "${widget.exercises[state.countCompletedExcercise].name}",
                                    style: TextStyle(
                                      color: AppColor.purpleDecor,
                                      fontSize: 19,
                                      fontFamily: "GT",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "${widget.exercises[state.countCompletedExcercise].description}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: "GT",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BlocBuilder<ExerciseCubit, ExerciseState>(
                builder: (context, state) {
                  if (state.status == ExerciseStatus.completedExcercise) {
                    return Positioned(
                      left: 20,
                      right: 20,
                      bottom: 25,
                      child: InkWell(
                        onTap: () async {
                          ExerciseCompleted exerciseCompleted =
                              ExerciseCompleted(
                                  namefit: widget.category.namefit,
                                  exerciseCount: widget.category.count,
                                  timeCount: widget.category.count / 2);

                          final exerciseCubit = context.read<ExerciseCubit>();
                          exerciseCubit.completedExcercise(exerciseCompleted);
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
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
