import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';
import 'components/schedule_item.dart';

class Schedule extends StatefulWidget {
  Schedule({Key key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
//     return Text('Hello, World!', style: Theme.of(context).textTheme.headline4);
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            SizedBox(height: 150.0 + 20.0),
            ScheduleItem(
              period: 1,
              className: "Adv. Physics",
              teacher: "Pedersen",
              room: "PSC201",
              color: paleOrange,
            ),
            ScheduleItem(
              period: 2,
              className: "Adv. Physics",
              teacher: "Pedersen",
              room: "PSC201",
              color: paleOrange,
            ),
            ScheduleItem(
              period: 3,
              className: "Community/Advisory",
              teacher: "Nobles",
              room: "COMM-1",
              color: paleRed,
            ),
            ScheduleItem(
              period: 4,
              className: "Chinese 5",
              teacher: "Zhou",
              room: "WRE312",
              color: palePink,
            ),
            ScheduleItem(
              period: 5,
              teacher: "",
              color: palePurple,
            ),
            ScheduleItem(
              period: 6,
              className: "English, Craft of Non-Fictions",
              teacher: "Polk",
              room: "WRN317",
              color: paleBlue,
            ),
            ScheduleItem(
              period: 7,
              teacher: "",
              color: paleOcean,
            ),
            ScheduleItem(
                period: 8,
                className: "US History",
                teacher: "Blanton",
                room: "WGG305",
                color: paleGreen),
          ],
        ),
        Container(
          width: double.infinity,
          height: 150,
          child: Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: '2021.05.07',
                    ),
                    TextSpan(
                        text: 'FRI', style: TextStyle(color: Colors.lightBlue)),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Chip(
                            label: Text("Mon"),
                            padding: EdgeInsets.symmetric(horizontal: 4.0)),
                        Chip(
                            label: Text("Tue"),
                            padding: EdgeInsets.symmetric(horizontal: 4.0)),
                        Chip(
                            label: Text("Wed"),
                            padding: EdgeInsets.symmetric(horizontal: 4.0)),
                        Chip(
                            label: Text("Thu"),
                            padding: EdgeInsets.symmetric(horizontal: 4.0)),
                        Chip(
                            label: Text("Fri"),
                            padding: EdgeInsets.symmetric(horizontal: 4.0)),
                      ]),
                )
              ],
            ),
            elevation: 5.0,
          ),
        )
      ],
    );
  }
}
