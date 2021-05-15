import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_events.dart';
import 'package:my_milton/blocs/schedule/schedule_states.dart';
import 'package:my_milton/components/column_builder.dart';
import 'package:my_milton/screens/schedule/components/top_bar.dart';
import 'package:my_milton/values/constants.dart';
import 'components/schedule_item.dart';

class Schedule extends StatefulWidget {
  Schedule({Key key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  GlobalKey _scheduleColumnKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    // final RenderBox scheduleColumnRenderbox = _scheduleColumnKey.currentContext.findRenderObject();
    // print(scheduleColumnRenderbox.size.height);
  }

  @override
  Widget build(BuildContext context) {
    final scheduleBloc = BlocProvider.of<ScheduleBloc>(context);

    scheduleBloc.add(FetchSchedule(DateTime.now()));

    return BlocBuilder<ScheduleBloc, ScheduleState>(builder: (context, state) {
      if (state is ScheduleNotCalled) {
        return Container();
      } else if (state is ScheduleLoading) {
        return Center(child: CircularProgressIndicator());
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
                  Container(
                    key: _scheduleColumnKey,
                    child: ColumnBuilder(
                      itemCount:
                          state.loadedSchedule.scheduledPeriods.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SizedBox(
                              height: topBarHeight + topItemDistanceFromTop);
                        }
                        return ScheduleItem.fromPeriodModel(
                            state.loadedSchedule.scheduledPeriods[index - 1]);
                      },
                    ),
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
