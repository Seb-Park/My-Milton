import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_events.dart';
import 'package:my_milton/blocs/schedule/schedule_states.dart';
import 'package:my_milton/screens/schedule/components/top_bar.dart';
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
    final scheduleBloc = BlocProvider.of<ScheduleBloc>(context);

    scheduleBloc.add(FetchSchedule(DateTime.now()));

    return BlocBuilder<ScheduleBloc, ScheduleState>(builder: (context, state) {
      if (state is ScheduleNotCalled) {
        return Container();
      } else if (state is ScheduleLoading) {
        return CircularProgressIndicator();
      } else if (state is ScheduleLoaded) {
        return Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: topBarHeight +
                            topItemDistanceFromTop +
                            scheduleItemMargin,
                      ),
                      Row(
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
                                      horizontal: (defaultDotSize -
                                              defaultTimelineWidth) /
                                          2),
                                  child: Container(
                                      width: defaultTimelineWidth,
                                      height: 500,
                                      child: Material(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    scheduleItemBorderRadius))),
                                        color: darkGray75,
                                      )),
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
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: topBarHeight + topItemDistanceFromTop),
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
                ],
              ),
            ),
            ScheduleTop()
          ],
        );
      }
      return Center(
        child: Text("Could not load Schedule"),
      );
    });
  }
}
