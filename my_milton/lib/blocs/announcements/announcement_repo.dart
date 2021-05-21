import 'package:my_milton/models/announcements_model.dart';

class AnnouncementsRepo{
    Future<AnnouncementsModel> getAnnouncements() async {
    final result = AnnouncementsModel.fromJson({"dummy":"json"});
    await Future.delayed(Duration(seconds: 3));
    return result;
  }
}