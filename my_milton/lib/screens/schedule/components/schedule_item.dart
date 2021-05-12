import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

class ScheduleItem extends StatelessWidget {
  String className;
  String teacher;
  String room;
  int period;
  Color color;

  ScheduleItem(
      {this.className, this.teacher, this.room, this.period, this.color});

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
                                      Text("8:05 - 8:50",
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
}
