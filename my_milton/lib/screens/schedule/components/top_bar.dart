import 'package:flutter/material.dart';
import 'package:my_milton/screens/schedule/components/schedule_day_chip.dart';

class ScheduleTop extends StatefulWidget {
  int dayNum;
  var dayChips = [
    new ScheduleWeekdayChip(
      dayName: "Mon",
      onTap: () {},
    ),
    new ScheduleWeekdayChip(
      dayName: "Tue",
      onTap: () {},
    ),
    new ScheduleWeekdayChip(
      dayName: "Wed",
      onTap: () {},
    ),
    new ScheduleWeekdayChip(
      dayName: "Thu",
      onTap: () {},
    ),
    new ScheduleWeekdayChip(
      dayName: "Fri",
      onTap: () {},
    )
  ];

  ScheduleTop({Key key}) : super(key: key);

  @override
  _ScheduleTopState createState() => _ScheduleTopState();
}

class _ScheduleTopState extends State<ScheduleTop> {
  void setDay(int dayNo) {
    setState(() {
      for (var i = 0; i < widget.dayChips.length; i++) {
        widget.dayChips[i].setActive(i == dayNo);
      }
    });
  }

  void _setChipFunctions() {
    for (var i = 0; i < widget.dayChips.length; i++) {
      widget.dayChips[i].onTap = () {
        setDay(i);
        print("set to day $i");
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    _setChipFunctions();
    return Container(
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
                  text: '2021.05.07\n',
                  style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w400),
                ),
                TextSpan(
                    text: 'FRI', style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold)),
              ],
            )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    widget.dayChips[0],
                    widget.dayChips[1],
                    widget.dayChips[2],
                    widget.dayChips[3],
                    widget.dayChips[4],
                  ]),
            )
          ],
        ),
        elevation: 5.0,
      ),
    );
  }
}
