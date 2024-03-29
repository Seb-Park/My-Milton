import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_events.dart';
import 'package:my_milton/blocs/schedule/schedule_states.dart';
import 'package:my_milton/components/column_builder.dart';
import 'package:my_milton/components/substitute_gradient_fab.dart';
import 'package:my_milton/screens/schedule/components/schedule_timeline.dart';
import 'package:my_milton/screens/schedule/components/schedule_top_bar.dart';
import 'package:my_milton/values/constants.dart';
import 'components/schedule_item.dart';

class Schedule extends StatefulWidget {
  Schedule({Key key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();

  ScheduleTimeline scheduleTimeline = new ScheduleTimeline();

  var scheduleTop = ScheduleTop(chipOnPressed: (){});
}

class _ScheduleState extends State<Schedule> {
  GlobalKey _scheduleColumnKey = GlobalKey();
  bool scheduleHasLoaded = false;

  @override
  void initState() {
    widget.scheduleTop.setDay(DateTime.now());
    print(DateTime.now().weekday);
    final scheduleBloc = BlocProvider.of<ScheduleBloc>(context);
    scheduleBloc.add(FetchSchedule(DateTime.now()));
    widget.scheduleTop.chipOnPressed = (){
    };
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  _afterLayout(_) {
    if (scheduleHasLoaded) {
      final RenderBox scheduleColumnRenderbox =
          _scheduleColumnKey.currentContext.findRenderObject();
      print(scheduleColumnRenderbox.size.height);
      widget.scheduleTimeline.lineLength.value = scheduleColumnRenderbox
              .size.height -
          (topBarHeight + topItemDistanceFromTop) -
          2 * scheduleItemMargin; //get column builder height but subtract dummy first item. Also subtract 2 sides of the schedule margin
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(builder: (context, state) {
      scheduleHasLoaded = (state is ScheduleLoaded);
      if (state is ScheduleNotCalled) {
        return Container();
      } else if (state is ScheduleLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ScheduleLoaded) {
        scheduleHasLoaded = true;
        WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
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
                      widget.scheduleTimeline,
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
            widget.scheduleTop,
            SubstituteGradientFAB(
              onPressed: () {},
              child: Icon(scheduleFabIcon, size: fabIconSize),
              gradient: mainBrightOrangeGradient,
            ),
          ],
        );
      }
      return Center(
        child: Text("Could not load Schedule"),
      );
    });
  }
}
