import 'package:flutter/material.dart';
import 'components/schedule_item.dart';

class Schedule extends StatefulWidget {
  Schedule({Key key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            ScheduleItem(),
            ScheduleItem(),
            ScheduleItem(),
            ScheduleItem(),
          ],
        ),
        Container(
          width: double.infinity,
          height: 150,
          child: Material(
            child: Column(
              children: <Widget>[
                RichText(
                    text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: '2021.05.03',
                    ),
                    TextSpan(
                        text: 'this text',
                        style: TextStyle(color: Colors.lightBlue)),
                  ],
                ))
              ],
            ),
            elevation: 5.0,
          ),
        )
      ],
    );
  }
}