import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'common/commonUtil.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class Calendar extends StatefulWidget {
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {

  DateTime _currentDate = DateTime.now();
  CommonUtil common = CommonUtil();

  void onDayPressed(DateTime date, List<Event> events) {
    this.setState(() {
      _currentDate = date;
      Fluttertoast.showToast(msg: common.chgeDateFormat(date));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
        child: CalendarCarousel<Event>(
            onDayPressed: onDayPressed,
            weekendTextStyle: TextStyle(color: Colors.red),
            thisMonthDayBorderColor: Colors.grey,
            weekFormat: false,
            height: 500.0,
            selectedDateTime: _currentDate,
            daysHaveCircularBorder: false,
            customGridViewPhysics: NeverScrollableScrollPhysics(),
            markedDateShowIcon: true,
            markedDateIconMaxShown: 2,
            todayTextStyle: TextStyle(
              color: Colors.blue,
            ),
            markedDateIconBuilder: (event) {
              return event.icon;
            },
            todayBorderColor: Colors.green,
            markedDateMoreShowTotal: false),
      ));
  }
}