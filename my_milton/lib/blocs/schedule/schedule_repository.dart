import 'dart:async';
import 'package:my_milton/models/schedule_model.dart';

class ScheduleRepo{
  Future<ScheduleModel> getSchedule(DateTime day) async {
    final result = ScheduleModel.fromJson({"dummy":"json"});
    await Future.delayed(Duration(seconds: 1));
    return result;
  }
}