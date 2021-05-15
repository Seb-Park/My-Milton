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
        periodNumber: 2,
        className: "Adv. Physics",
        teacherLastName: "Pedersen",
        room: "PSC201",
        courseCode: "SCAP-2",
        startTime: Duration(hours: 9, minutes: 00),
        endTime: Duration(hours: 9, minutes: 45),
      ),
      PeriodModel(
        periodNumber: 3,
        className: "Community/Advisory",
        teacherLastName: "Nobles",
        room: "",
        courseCode: "COMM-1",
        startTime: Duration(hours: 10),
        endTime: Duration(hours: 10, minutes: 45),
      ),
      PeriodModel(
        periodNumber: 4,
        className: "Chinese 5",
        teacherLastName: "Zhou",
        room: "WRE312",
        courseCode: "CH5-1",
        startTime: Duration(hours: 10, minutes: 55),
        endTime: Duration(hours: 11, minutes: 40),
      ),
      PeriodModel(
        periodNumber: 5,
        className: "",
        teacherLastName: "",
        room: "",
        courseCode: "",
        startTime: Duration(hours: 11, minutes: 50),
        endTime: Duration(hours: 12, minutes: 35),
      ),
      PeriodModel(
        periodNumber: 6,
        className: "English, Craft of Non-Fictions",
        teacherLastName: "Polk",
        room: "WRN317",
        courseCode: "ENNF-1",
        startTime: Duration(hours: 12, minutes: 30),
        endTime: Duration(hours: 1, minutes: 15),
      ),
      PeriodModel(
        periodNumber: 7,
        className: "",
        teacherLastName: "",
        room: "",
        courseCode: "",
        startTime: Duration(hours: 1, minutes: 25),
        endTime: Duration(hours: 2, minutes: 10),
      ),
      PeriodModel(
        periodNumber: 8,
        className: "US History",
        teacherLastName: "Blanton",
        room: "WGG305",
        courseCode: "HUS-7",
        startTime: Duration(hours: 2, minutes: 20),
        endTime: Duration(hours: 3, minutes: 5),
      ),
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
