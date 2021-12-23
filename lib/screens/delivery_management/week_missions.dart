import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';

class WeekMissions extends StatelessWidget {
  const WeekMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _DateManager(),
            SizedBox(height: 2),
            Divider(),
            Expanded(child: _missions()),
          ],
        ),
      ),
    );
  }

  Widget _missions() {
    return ListView.builder(
      itemCount: 13,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: _MissionItem(
            time: '11:00 AM',
            mission:
                'This is mission from me and how are you today I try my best in this app for this reason ' *
                    (Random.secure().nextInt(3) + 1)),
      ),
    );
  }
}

class _DateManager extends StatefulWidget {
  const _DateManager({Key? key}) : super(key: key);

  @override
  State<_DateManager> createState() => _DateManagerState();
}

class _DateManagerState extends State<_DateManager> {
  late DateTime currentMonth = DateTime.now();
  @override
  Widget build(BuildContext context) {
    print(currentMonth);
    return Column(children: [
      _monthAndActions(),
      _DateBuilder(startDate: currentMonth),
    ]);
  }

  Widget _monthAndActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                _actionButton(Icons.arrow_back_ios, increaseMonth),
                _actionButton(Icons.arrow_forward_ios, decreaseMonth),
              ],
            )),
        Text(
          intl.DateFormat('MMMM, yyyy').format(currentMonth),
          style: getLightStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _actionButton(IconData icon, VoidCallback onPressed) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(4),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 18.h,
              ),
            ),
          ),
        ),
      );
    });
  }

  void increaseMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    });
  }

  void decreaseMonth() {
    if (currentMonth.month == DateTime.now().month &&
        currentMonth.year == DateTime.now().year) {
    } else {
      setState(() {
        if (currentMonth.month == DateTime.now().month + 1 &&
            currentMonth.year == DateTime.now().year) {
          currentMonth = DateTime.now();
        } else {
          currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
        }
      });
    }
  }
}

class _DateBuilder extends StatelessWidget {
  _DateBuilder({Key? key, required this.startDate}) : super(key: key) {
    fillRemainingDaysInMonth();
  }
  final DateTime startDate;
  final List<DateTime> remainingDays = [];

  void fillRemainingDaysInMonth() {
    final DateTime nextMonth = DateTime(startDate.year, startDate.month + 1);
    final DateTime lastDayInCurrentMonth =
        nextMonth.subtract(Duration(days: 1));
    DateTime dateTime = startDate;
    while (dateTime.day != lastDayInCurrentMonth.day) {
      remainingDays.add(dateTime);
      dateTime = dateTime.add(Duration(days: 1));
    }
    remainingDays.add(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 0,
      child: SizedBox(
        height: height * 0.14,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: remainingDays.length,
          itemBuilder: (_, index) => InkWell(
            onTap: () {},
            child: _DateItem(
              date: remainingDays[index],
              color: Random.secure().nextInt(30) % 4 == 0 ? Colors.grey : null,
            ),
          ),
        ),
      ),
    );
  }
}

class _DateItem extends StatelessWidget {
  const _DateItem({Key? key, required this.date, this.color}) : super(key: key);
  final DateTime date;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dayName = intl.DateFormat('EEE').format(date);
    final dayNumber = intl.DateFormat('dd').format(date);
    final double width = MediaQuery.of(context).size.width;
    final fontColor =
        color == null && !_isToday() ? Colors.black : Colors.white;
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      width: width * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: _isToday() ? ColorManager.buttonColor : color ?? Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: FittedBox(
              child: Text(
                dayName,
                style: getRegularStyle(fontSize: 19, color: fontColor),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              dayNumber,
              style: getRegularStyle(fontSize: 19, color: fontColor),
            ),
          ),
          Spacer(),
          if (_isToday())
            Expanded(
              child: FittedBox(
                child: Text(
                  'Today',
                  style: getRegularStyle(fontSize: 19, color: fontColor),
                ),
              ),
            ),
        ],
      ),
    );
  }

  bool _isToday() {
    final DateTime now = DateTime.now();
    return date.day == now.day &&
        date.year == now.year &&
        date.month == now.month;
  }
}

class _MissionItem extends StatelessWidget {
  const _MissionItem({Key? key, required this.time, required this.mission})
      : super(key: key);
  final String time;
  final String mission;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _time(context),
        SizedBox(width: 10),
        Expanded(child: _mission()),
      ],
    );
  }

  Widget _time(BuildContext context) {
    return Text(
      time,
      style: getRegularStyle().copyWith(
          decoration: TextDecoration.underline,
          decorationColor: Theme.of(context).primaryColor),
    );
  }

  Widget _mission() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorManager.primaryLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        mission,
        style: getRegularStyle(fontSize: 15),
        softWrap: true,
      ),
    );
  }
}
