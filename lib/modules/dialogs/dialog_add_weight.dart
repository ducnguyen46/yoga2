import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/modules/dialogs/dialog_alert.dart';
import 'package:yoga/modules/progress/cubit/progress_cubit.dart';

class DialogAddWeight extends StatefulWidget {
  @override
  _DialogAddWeightState createState() => _DialogAddWeightState();
}

class _DialogAddWeightState extends State<DialogAddWeight> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  Color _selected = AppColor.purpleDecor;
  Color _unSelected = AppColor.purpleDecor.withOpacity(0.5);
  bool _selectKg = true;
  bool _selectLb = false;

  TextEditingController _weightController = TextEditingController();
  late FocusNode _focusWeight;
  static const String regex = r"^([1-9][0-9]*)(\.?)([0-9]*)$";

  void _addWeightCompleted(String value) {
    RegExp regExpDoubleNumber = RegExp(regex);
    if (!regExpDoubleNumber.hasMatch(value)) {
      _showAlertDialog("Hmmmm, have wrong weight?!",
          "Enter the correct number for your weight\n Ex: 50, 50.5", false);
      _focusWeight.requestFocus();
    } else {
      _addWeightToDB(context, double.parse(value), _selectedDay, _selectKg);
    }
  }

  void _addWeightToDB(
      BuildContext context, double weight, DateTime date, bool isKg) async {
    const double lbToKg = 0.45359; // 1 pound = 0.4536 kg
    if (!isKg) {
      weight = double.parse((weight * lbToKg).toStringAsFixed(4));
    }
    await context.read<ProgressCubit>().addWeight(weight, date).then((_) {
      Navigator.pop(context);
      _showAlertDialog("Success!",
          "We just add your weight!. Have a nice day with strong body!", true);
    }, onError: (error) {
      print("This is error: $error");
    });
  }

  void _showAlertDialog(String title, String subTitle, bool isSuccess) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        // backgroundColor: AppColor.grayBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: DialogAlert(
          title: title,
          subTitle: subTitle,
          isSuccess: isSuccess,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _focusWeight = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _weightController.dispose();
    _focusWeight.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var widthDialog = size.width - 80;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //calendar
        //
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TableCalendar(
            rowHeight: 46,
            calendarBuilders: CalendarBuilders(
              // custom cho tháng - năm trên đầu lịch
              headerTitleBuilder: (BuildContext context, DateTime day) {
                var month = DateFormat("MMMM yyyy").format(day);
                return Text(
                  month,
                  style: TextStyle(
                    color: AppColor.pupleBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: "GT",
                  ),
                );
              },

              //custom cho thứ trong tuần
              dowBuilder: (context, day) {
                final text = DateFormat("E").format(day);
                return Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: AppColor.pupleBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: "GT",
                    ),
                  ),
                );
              },

              selectedBuilder: (context, day, focusedDay) {
                final dayInMonth = DateFormat("dd").format(focusedDay);
                return Center(
                  child: Container(
                    height: 46 * 0.75,
                    width: 46 * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        dayInMonth,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day - 7,
            ),
            lastDay: DateTime.utc(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day + 1,
            ),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
          ),
        ),

        // get weight
        //
        Padding(
          padding: const EdgeInsets.only(
            top: 6,
            left: 24,
            right: 24,
            bottom: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              //text field weight
              Container(
                width: size.width / 4,
                decoration: BoxDecoration(),
                child: TextField(
                  autocorrect: false,
                  controller: _weightController,
                  focusNode: _focusWeight,
                  cursorColor: AppColor.purpleDecor.withOpacity(0.4),
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.purpleDecor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your weight",
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              // kg lb convert
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectKg = !_selectKg;
                          _selectLb = !_selectLb;
                        });
                      },
                      child: Text(
                        "kg",
                        style: TextStyle(
                          fontSize: 18,
                          color: _selectKg ? _selected : _unSelected,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectLb = !_selectLb;
                          _selectKg = !_selectKg;
                        });
                      },
                      child: Text(
                        "lb",
                        style: TextStyle(
                          fontSize: 18,
                          color: _selectLb ? _selected : _unSelected,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //button
        ///
        Row(
          children: [
            InkWell(
              splashColor: AppColor.purpleDecor,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 54,
                width: widthDialog / 2,
                decoration: BoxDecoration(
                  color: AppColor.purpleDecor.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Cancle",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: AppColor.purpleDecor.withOpacity(0.7),
              onLongPress: () {},
              onTap: () {
                _addWeightCompleted(_weightController.text);
              },
              child: Container(
                height: 54,
                width: widthDialog / 2,
                decoration: BoxDecoration(
                  color: AppColor.purpleDecor.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
