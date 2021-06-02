import 'package:flutter/material.dart';
import 'package:my_milton/components/curved_top_bar_clipper.dart';
import 'package:my_milton/screens/schedule/components/schedule_day_chip.dart';
import 'package:my_milton/values/constants.dart';
import 'package:my_milton/extensions/duration_extension.dart';

class ScheduleTop extends StatefulWidget {
  DateTime currentViewingDay = DateTime.now();
  int currentViewingWeek = 0;
  bool isViewingToday = true;
  int relativeWeekViewing = 0;
  int dayNum;
  void Function() chipOnPressed;
  final dayChips = [
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

  void setDay(DateTime dt) {
    currentViewingDay = dt;
    currentViewingWeek = relativeWeekViewing;
    isViewingToday =
        TimeMethods.checkIfDayIsSame(DateTime.now(), currentViewingDay);
    for (var i = 0; i < dayChips.length; i++) {
      dayChips[i].setActive(i == dt.weekday - 1);
    }
    print(currentViewingDay.toUtc());
  }

  ScheduleTop({Key key, @required this.chipOnPressed}) : super(key: key);

  @override
  _ScheduleTopState createState() => _ScheduleTopState();
}

class _ScheduleTopState extends State<ScheduleTop> {
  void _setChipFunctions() {
    for (var i = 0; i < widget.dayChips.length; i++) {
      widget.dayChips[i].onTap = () {
        setState(() {
          widget.setDay(TimeMethods.getDayInTheWeekOf(
              TimeMethods.addWeeks(DateTime.now(), widget.relativeWeekViewing),
              i + 1));
          widget.chipOnPressed();
        });
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: scheduleTopBarTitleInset),
                    child: RichText(
                        text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: TimeMethods.dateTimeToYYYYMMDD(
                                  widget.currentViewingDay) +
                              "\n",
                          style: topBarDateStyle,
                        ),
                        widget.isViewingToday
                            ? TextSpan(
                                text: "TODAY",
                                style: topBarWeekdayStyle,
                              )
                            : TextSpan(
                                text: TimeMethods.getShortenedWeekday(
                                        widget.currentViewingDay)
                                    .toUpperCase(),
                                style: topBarWeekdayStyle.copyWith(
                                    color: Colors.white.withAlpha(50)),
                              ),
                      ],
                    )),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            color: scheduleArrowIconsColor,
                          ),
                        ),
                        widget.dayChips[0],
                        widget.dayChips[1],
                        widget.dayChips[2],
                        widget.dayChips[3],
                        widget.dayChips[4],
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: scheduleArrowIconsColor,
                          ),
                        ),
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
