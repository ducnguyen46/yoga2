import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/core/datasource/database_provider.dart';
import 'package:yoga/models/weight.dart';
import 'package:yoga/modules/progress/cubit/progress_cubit.dart';

class LineChartWeight extends StatefulWidget {
  @override
  _LineChartWeightState createState() => _LineChartWeightState();
}

class _LineChartWeightState extends State<LineChartWeight> {
  List<Color> gradientColors = [
    AppColor.grayBlue.withOpacity(0.05),
    AppColor.grayBlue.withOpacity(0.3),
    AppColor.grayBlue.withOpacity(0.7),
  ];

  @override
  void initState() {
    super.initState();
  }

  void getMaxWeight() {
    FutureBuilder(
      future: DatabaseProvider.db.getMaxWeight(),
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        if (snapshot.hasData) {
          double maxWeight = snapshot.data ?? 0;
          print(maxWeight);
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProgressCubit, ProgressState>(
      buildWhen: (previous, current) {
        return previous.status == ProgressStatus.loadingWeight &&
            current.status == ProgressStatus.loaded;
      },
      builder: (context, state) {
        List<Weight> listAllWeight = [];
        if (state.weights.length > 14) {
          listAllWeight = state.weights.sublist(0, 14).reversed.toList();
        } else {
          listAllWeight = state.weights.reversed.toList();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AspectRatio(
            aspectRatio: 1.4,
            child: Container(
              width: size.width - 50,
              height: size.height * 1 / 3,
              decoration: BoxDecoration(),
              child: LineChart(
                LineChartData(
                  maxX: listAllWeight.length - 1,
                  minY: state.minWeight - 5,
                  maxY: state.maxWeight + 5,
                  borderData: FlBorderData(
                    show: false,
                    border: Border.all(
                        color: const Color(0xff37434d).withOpacity(0.2),
                        width: 1),
                  ),

                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        String date =
                            "${listAllWeight[value.toInt()].date}/${listAllWeight[value.toInt()].month}";
                        return Text(
                          date,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Color(0xFF7C7D80),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        );
                      },
                    )),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Color(0xFF7C7D80),
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          );
                        },
                        reservedSize: 24,
                      ),
                    ),
                  ),
                  //line data
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        for (int i = 0; i < listAllWeight.length; i++)
                          FlSpot(double.parse("$i"), listAllWeight[i].weight)
                      ],
                      isCurved: true,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      color: AppColor.grayBlue,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
