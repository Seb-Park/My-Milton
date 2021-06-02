import 'package:flutter/material.dart';
import 'package:my_milton/extensions/duration_extension.dart';
import 'package:my_milton/screens/schedule/components/schedule_item.dart';
import 'package:my_milton/screens/schedule/schedule.dart';
import 'package:my_milton/values/constants.dart';

class SchedulePeriodPopup extends StatefulWidget {
  final Gradient backgroundGradient;
  final String className;
  final String teacher;
  final String room;
  final int period;
  final Duration startTime;
  final Duration endTime;
  final String courseCode;
  SchedulePeriodPopup(
      {Key key,
      this.backgroundGradient,
      this.className,
      this.teacher,
      this.room,
      this.period,
      this.startTime,
      this.endTime,
      this.courseCode})
      : super(key: key);

  @override
  _SchedulePeriodPopupState createState() => _SchedulePeriodPopupState();

  factory SchedulePeriodPopup.fromScheduleItem(ScheduleItem si) {
    return SchedulePeriodPopup(
      backgroundGradient: si.gradient,
      className: si.className,
      teacher: si.teacher,
      room: si.room,
      period: si.period,
      startTime: si.startTime,
      endTime: si.endTime,
      courseCode: si.courseCode,
    );
  }
}

class _SchedulePeriodPopupState extends State<SchedulePeriodPopup> {
  double dialogHeight = periodPopupStartHeight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(_) {
    setState(() {
      dialogHeight = MediaQuery.of(context).size.height / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: AnimatedContainer(
        // decoration: BoxDecoration(gradient: widget.backgroundGradient),
        height: dialogHeight,
        curve: Curves.easeInOutQuart,
        duration: animatedPopupAnimationDuration,
        child: Card(
          child: Ink(
            decoration: BoxDecoration(gradient: widget.backgroundGradient),
            child: Padding(
              padding: const EdgeInsets.all(periodPopupPadding),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.className,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(widget.courseCode),
                      Text("Teacher: ${widget.teacher}"),
                      Text("Room: ${widget.room}"),
                      Text(
                          "${TimeMethods.durationToReadableTime(widget.startTime)} - ${TimeMethods.durationToReadableTime(widget.endTime)}")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(periodPopupBorderRadius))),
    );
  }
}
