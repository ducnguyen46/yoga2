import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/modules/dialogs/dialog_add_weight.dart';
import 'package:yoga/modules/progress/cubit/progress_cubit.dart';
import 'package:yoga/modules/progress/widget/calculate_exercise.dart';
import 'package:yoga/modules/progress/widget/chart_weight.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          child: BlocBuilder<ProgressCubit, ProgressState>(
            buildWhen: (previous, current) =>
                (previous.status == ProgressStatus.initial ||
                    previous.status == ProgressStatus.loading) &&
                current.status == ProgressStatus.loaded,
            builder: (context, state) {
              if (state.status == ProgressStatus.initial ||
                  state.status == ProgressStatus.loading) {
                return Center(
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                );
              }
              return ListView(
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
                          AppLocalizations.of(context)!.progress,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            fontFamily: "GT",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showAddWeightDialog(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: AppColor.lightGray.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.add_weight,
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
                              AppLocalizations.of(context)!.current,
                              style: TextStyle(
                                color: AppColor.blueDark,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: "GT",
                              ),
                            ),
                            BlocBuilder<ProgressCubit, ProgressState>(
                              buildWhen: (previous, current) =>
                                  previous.status ==
                                  ProgressStatus.loadingWeight,
                              builder: (context, state) {
                                return Text(
                                  "${state.currentWeight} kg",
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
                                AppLocalizations.of(context)!.max,
                                style: TextStyle(
                                  color: AppColor.blueDark,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "GT",
                                ),
                              ),
                              BlocBuilder<ProgressCubit, ProgressState>(
                                buildWhen: (previous, current) =>
                                    previous.status ==
                                    ProgressStatus.loadingWeight,
                                builder: (context, state) {
                                  return Text(
                                    "${state.maxWeight} kg",
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
                              AppLocalizations.of(context)!.min,
                              style: TextStyle(
                                color: AppColor.blueDark,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: "GT",
                              ),
                            ),
                            BlocBuilder<ProgressCubit, ProgressState>(
                              buildWhen: (previous, current) =>
                                  previous.status ==
                                  ProgressStatus.loadingWeight,
                              builder: (context, state) {
                                return Text(
                                  "${state.minWeight} kg",
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
                            AppLocalizations.of(context)!.statistic,
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
                            BlocBuilder<ProgressCubit, ProgressState>(
                              // buildWhen: (previous, current) =>
                              //     previous.status ==
                              //         ProgressStatus.loadingExercise &&
                              //     current.status == ProgressStatus.loaded,
                              builder: (context, state) {
                                return CalculateExercise(
                                  value: state.countWorkoutCompleted != null
                                      ? "${state.countWorkoutCompleted}"
                                      : AppLocalizations.of(context)!.no_info,
                                  title: AppLocalizations.of(context)!.workout,
                                );
                              },
                            ),
                            BlocBuilder<ProgressCubit, ProgressState>(
                              buildWhen: (previous, current) =>
                                  previous.status ==
                                      ProgressStatus.loadingExercise &&
                                  current.status == ProgressStatus.loaded,
                              builder: (context, state) {
                                return CalculateExercise(
                                  value: state.countExerciseCompleted != null
                                      ? "${state.countExerciseCompleted}"
                                      : AppLocalizations.of(context)!.no_info,
                                  title:
                                      AppLocalizations.of(context)!.exercises,
                                );
                              },
                            ),
                            BlocBuilder<ProgressCubit, ProgressState>(
                              buildWhen: (previous, current) =>
                                  previous.status ==
                                      ProgressStatus.loadingExercise &&
                                  current.status == ProgressStatus.loaded,
                              builder: (context, state) {
                                return CalculateExercise(
                                  value: state.timeWorkoutCompleted != null
                                      ? "${state.timeWorkoutCompleted}"
                                      : AppLocalizations.of(context)!.no_info,
                                  title: AppLocalizations.of(context)!.minutes,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
