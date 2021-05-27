import 'package:bloc/bloc.dart';
import 'package:my_milton/blocs/announcements/announcement_events.dart';
import 'package:my_milton/blocs/announcements/announcement_repo.dart';
import 'package:my_milton/blocs/announcements/announcement_states.dart';
import 'package:my_milton/models/announcements_model.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent, AnnouncementsState>{
  AnnouncementsRepo announcementsRepo;
  AnnouncementsBloc(this.announcementsRepo) : super(AnnouncementsNotCalled());

  @override
  Stream<AnnouncementsState> mapEventToState(event) async* {
    if (event is FetchAnnouncements) {
      yield AnnouncementsLoading();
      try {
        AnnouncementsModel announcementsModel = await announcementsRepo.getAnnouncements();
        yield(AnnouncementsLoaded(announcementsModel));
      } catch (_) {
        yield AnnouncementsFailed();
      }
    }
    else if(event is RefreshAnnouncements) {
      yield AnnouncementsNotCalled();
    }  }

}