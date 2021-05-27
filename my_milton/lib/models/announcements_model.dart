class AnnouncementsModel {
  final List<SingleAnnouncementModel> announcements;

  AnnouncementsModel({this.announcements});

  factory AnnouncementsModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementsModel(announcements: [
      SingleAnnouncementModel(
          title: "Come to Forbes!",
          author: "Ryan Stone",
          announcement: "Come to Forbes now or you're expelled. This is not a drill. You MUST EAT NOW or else you will not receive your diploma! Also, bring a quarter with you. We will continue to fill that sock with quarters. If you have dollar coins that will also work. :) Also, we have another all class meeting coming up next week on Tuesday at 9:50am. We know you've gotten into the habit of sleeping in, so make sure to set your alarms!",
          postTimestamp: DateTime.now().add(Duration(hours: -1)),
          tags: ["class_2021"]),
      SingleAnnouncementModel(
          title: "Come to CS",
          author: "Chris Hales",
          announcement:
              "Hi everyone. Please come to the computer science thing.",
          postTimestamp: DateTime.now().add(Duration(hours: -3)),
          tags: ["compscistudents", "progclub"]),
      SingleAnnouncementModel(
          title: "Come to CS",
          author: "Chris Hales",
          announcement:
              "Hi everyone. Please come to the computer science thing.",
          postTimestamp: DateTime.now().add(Duration(hours: -3)),
          tags: ["compscistudents", "progclub"]),
      SingleAnnouncementModel(
          title: "Come to CS",
          author: "Chris Hales",
          announcement:
              "Hi everyone. Please come to the computer science thing.",
          postTimestamp: DateTime.now().add(Duration(hours: -3)),
          tags: ["compscistudents", "progclub"]),
      SingleAnnouncementModel(
          title: "Come to CS",
          author: "Chris Hales",
          announcement:
              "Hi everyone. Please come to the computer science thing.",
          postTimestamp: DateTime.now().add(Duration(hours: -3)),
          tags: ["compscistudents", "progclub"]),
      SingleAnnouncementModel(
          title: "Come to CS",
          author: "Chris Hales",
          announcement:
              "Hi everyone. Please come to the computer science thing.",
          postTimestamp: DateTime.now().add(Duration(hours: -3)),
          tags: ["compscistudents", "progclub"]),
      SingleAnnouncementModel(
          title: "Come to CS",
          author: "Chris Hales",
          announcement:
              "Hi everyone. Please come to the computer science thing.",
          postTimestamp: DateTime.now().add(Duration(hours: -3)),
          tags: ["compscistudents", "progclub"]),
      SingleAnnouncementModel(
          title: "Come to CS",
          author: "Chris Hales",
          announcement:
              "Hi everyone. Please come to the computer science thing.",
          postTimestamp: DateTime.now().add(Duration(hours: -3)),
          tags: ["compscistudents", "progclub"]),
    ]);
  }
}

class SingleAnnouncementModel {
  final String title;
  final String author;
  final String announcement;
  final DateTime postTimestamp;
  final List<String> tags;

  SingleAnnouncementModel(
      {this.title,
      this.author,
      this.announcement,
      this.postTimestamp,
      this.tags});
}
