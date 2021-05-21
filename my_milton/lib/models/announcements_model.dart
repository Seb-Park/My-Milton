
class AnnouncementsModel {
  final List<SingleAnnouncementModel> announcements;

  AnnouncementsModel({this.announcements});

  factory AnnouncementsModel.fromJson(Map<String, dynamic> json){
    return AnnouncementsModel(announcements: []);
  }
}

class SingleAnnouncementModel{
  final String author;
  final String announcement;
  final DateTime postTimestamp;
  final List<String> tags;

  SingleAnnouncementModel({this.author, this.announcement, this.postTimestamp, this.tags});
}