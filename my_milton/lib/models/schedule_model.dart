class ScheduleModel {
  final DateTime date;
  final List<PeriodModel> scheduledPeriods;
  final List<EventModel> scheduledEvents;

  ScheduleModel({this.date, this.scheduledPeriods, this.scheduledEvents});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(date: DateTime.now(), scheduledPeriods: [
      PeriodModel(
        periodNumber: 1,
        className: "Adv. Physics",
        teacherLastName: "Pedersen",
        room: "PSC201",
        courseCode: "SCAP-2",
        startTime: Duration(hours: 8, minutes: 05),
        endTime: Duration(hours: 8, minutes: 50),
      ),
      PeriodModel(
        periodNumber: 0,
        className: "Adv. Physics",
        teacherLastName: "Pedersen",
        room: "PSC201",
        courseCode: "SCAP-2",
        startTime: Duration(hours: 9, minutes: 00),
        endTime: Duration(hours: 9, minutes: 45),
      )
    ], scheduledEvents: []);
  }
}

class PeriodModel {
  final String className;
  final String teacherLastName;
  final String room;
  final String courseCode;
  final int periodNumber;
  final Duration startTime;
  final Duration endTime;

  PeriodModel(
      {this.className,
      this.teacherLastName,
      this.room,
      this.courseCode,
      this.periodNumber,
      this.startTime,
      this.endTime});
}

class EventModel {
  final String name;
  final int startTime;
  final int endTime;
  final bool isWeekly;

  EventModel(this.name, this.startTime, this.endTime, this.isWeekly);
}
