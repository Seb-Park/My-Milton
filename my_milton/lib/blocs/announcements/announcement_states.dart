import 'package:equatable/equatable.dart';
import 'package:my_milton/models/Announcements_model.dart';
import 'package:my_milton/models/announcements_model.dart';

abstract class AnnouncementsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AnnouncementsNotCalled extends AnnouncementsState {}

class AnnouncementsLoading extends AnnouncementsState {}

class AnnouncementsLoaded extends AnnouncementsState {
  final AnnouncementsModel loadedAnnouncements;
  AnnouncementsLoaded(this.loadedAnnouncements);
}

class AnnouncementsFailed extends AnnouncementsState {}