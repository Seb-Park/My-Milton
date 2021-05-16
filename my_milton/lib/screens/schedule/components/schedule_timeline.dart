import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

class ScheduleTimeline extends StatefulWidget {
  ScheduleTimeline({Key key}) : super(key: key);

  ValueNotifier<double> lineLength = ValueNotifier(20.0);



  @override
  _ScheduleTimelineState createState() => _ScheduleTimelineState();
}

class _ScheduleTimelineState extends State<ScheduleTimeline> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("x",
                    style: TextStyle(
                        color: Colors.transparent,
                        fontSize: schedulePeriodFontSize)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: (defaultDotSize - defaultTimelineWidth) / 2),
                  child: ValueListenableBuilder<double>(
                    valueListenable: widget.lineLength,
                    builder: (context, value, _) {
                      return AnimatedContainer(
                          curve: Curves.easeOutQuad,
                          duration: Duration(seconds: 1),
                          width: defaultTimelineWidth,
                          height: value,
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(scheduleItemBorderRadius))),
                            color: darkGray75,
                          ));
                    }
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(scheduleItemMargin),
              child: Container(
                  child: SizedBox(
                width: schedulePeriodWidth,
                height: 20,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
