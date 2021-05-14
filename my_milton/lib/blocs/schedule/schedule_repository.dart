import 'package:my_milton/models/schedule_model.dart';

class ScheduleRepo{
  Future<ScheduleModel> getSchedule(DateTime day) async {
    final result = ScheduleModel.fromJson({"dummy":"json"});
    return result;
  }
}