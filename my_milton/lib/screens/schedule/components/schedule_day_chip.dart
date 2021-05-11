import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

class ScheduleWeekdayChip extends StatefulWidget {
  String dayName;
  ValueNotifier<bool> isActive = ValueNotifier(false);
  Function onTap;

  void setActive(bool toSetActive) {
    isActive.value = toSetActive;
  }

  ScheduleWeekdayChip({Key key, this.dayName, this.onTap}) : super(key: key);

  @override
  _ScheduleWeekdayChipState createState() => _ScheduleWeekdayChipState();
}

class _ScheduleWeekdayChipState extends State<ScheduleWeekdayChip> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.isActive,
        builder: (context, value, _) {
          return ActionChip(
            onPressed: () {
              setState(() {
                widget.onTap();
              });
            },
            backgroundColor: widget.isActive.value ? darkGray75 : Colors.transparent,
            label: Text(widget.dayName,
                style: TextStyle(
                  color: widget.isActive.value ? Colors.white : darkGray75,
                )),
            padding: EdgeInsets.symmetric(horizontal: 4.0),
          );
        });
  }
}
