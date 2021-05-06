import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/models/weight.dart';

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

  double maxWeight;

  @override
  void initState() {
    super.initState();
  }

  void getMaxWeight() {
    FutureBuilder(
      future: DatabaseProvider.db.getMaxWeight(),
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        if (snapshot.hasData) {
          maxWeight = snapshot.data;
          maxWeight ??= 0;
          print(maxWeight);
        }
        return;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Weight> listAllWeight = [];
    return FutureBuilder(
      future: DatabaseProvider.db.getAllWeight(),
      builder: (context, AsyncSnapshot<List<Weight>> snapshot) {
        if (snapshot.hasData) {
          // get 14 weight DESC
          //

          if (snapshot.data.length > 14) {
            listAllWeight = snapshot.data.sublist(0, 14).reversed.toList();
          } else {
            listAllWeight = snapshot.data.reversed.toList();
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
                    //data range
                    minX: 0,
                    maxX: double.parse("${snapshot.data.length - 1}"),
                    minY: 0,

                    borderData: FlBorderData(
                      show: false,
                      border: Border.all(
                          color: const Color(0xff37434d).withOpacity(0.2),
                          width: 1),
                    ),

                    gridData: FlGridData(
                      show: false,
                    ),

                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTextStyles: (value) => const TextStyle(
                          color: Color(0xFF7C7D80),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                        getTitles: (value) {
                          String date =
                              "${listAllWeight[value.toInt()].date}/${listAllWeight[value.toInt()].month}";
                          return date;
                        },
                        margin: 8,
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(
                          color: Color(0xFF7C7D80),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                        getTitles: (weight) {
                          // double weight = listAllWeight[value.toInt()].weight;
                          if (weight % 10 == 0.0) {
                            return "$weight";
                          } else
                            return "";
                        },
                        reservedSize: 28,
                        margin: 12,
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
                        colors: [AppColor.grayBlue],
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: gradientColors,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Container(
          width: size.width - 50,
          height: size.height * 1 / 3,
          child: Center(
            child: Container(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 6,
              ),
            ),
          ),
        );
      },
    );
  }
}
