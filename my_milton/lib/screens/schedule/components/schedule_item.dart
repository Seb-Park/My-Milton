import 'package:flutter/material.dart';
import 'package:my_milton/models/schedule_model.dart';
import 'package:my_milton/values/constants.dart';
import 'package:my_milton/extensions/duration_extension.dart';

class ScheduleItem extends StatelessWidget {
  String className;
  String teacher;
  String room;
  int period;
  Color color;
  Duration startTime;
  Duration endTime;
  
  ScheduleItem(
      {this.className, this.teacher, this.room, this.period, this.color, this.startTime, this.endTime});

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    this.period.toString(),
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: schedulePeriodFontSize,
                    ),
                  ),
                  Container(
                    height: defaultDotSize,
                    width: defaultDotSize,
                    child: Material(
                        color: darkGray75, shape: CircleBorder()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(scheduleItemMargin),
              child: Container(
                width: schedulePeriodWidth,
                child: MaterialButton(
                  color: this.color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(scheduleItemBorderRadius))),
                  onPressed: () {},
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: scheduleItemTextVerticalPadding),
                    child: this.className == null
                        ? SizedBox()
                        : Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.bookmark),
                              ),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        this.className,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                      Text("${this.teacher} ${this.room}"),
                                      Text("${TimeMethods.durationToReadableTime(startTime)} - ${TimeMethods.durationToReadableTime(endTime)}",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300))
                                    ]),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  factory ScheduleItem.fromPeriodModel(PeriodModel periodModel){
    return ScheduleItem(
      className: periodModel.className,
      teacher: periodModel.teacherLastName,
      room: periodModel.room,
      period: periodModel.periodNumber,
      color: periodColorOrder[periodModel.periodNumber-1],
      startTime: periodModel.startTime,
      endTime: periodModel.endTime,
    );
  }
}
