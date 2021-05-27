import 'package:flutter/material.dart';
import 'package:my_milton/components/curved_top_bar_clipper.dart';
import 'package:my_milton/screens/schedule/components/schedule_day_chip.dart';
import 'package:my_milton/values/constants.dart';
import 'package:my_milton/extensions/duration_extension.dart';

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
      };
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _setChipFunctions();
    return CustomPaint(
      painter: CurvedTopBarShadowPainter(),
      child: ClipPath(
        clipper: CurvedTopBarClipper(),
        child: Material(
          elevation: 0.0,
          child: Container(
            decoration: BoxDecoration(
              gradient: mainBrightBlueGradient,
            ),
            width: double.infinity,
            height: topBarHeight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: scheduleTopBarInset),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: TimeMethods.dateTimeToYYYYMMDD(DateTime.now()) +
                            "\n",
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'FRI',
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        widget.dayChips[0],
                        widget.dayChips[1],
                        widget.dayChips[2],
                        widget.dayChips[3],
                        widget.dayChips[4],
                      ]),
                  SizedBox(height: curvedTopBarCurvature),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
