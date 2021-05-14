import 'package:bloc/bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_events.dart';
import 'package:my_milton/blocs/schedule/schedule_repository.dart';
import 'package:my_milton/blocs/schedule/schedule_states.dart';
import 'package:my_milton/models/schedule_model.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {

  ScheduleRepo scheduleRepo;
  ScheduleBloc(this.scheduleRepo);

  @override
  ScheduleState get initialState => ScheduleNotCalled();

  @override
  Stream<ScheduleState> mapEventToState(ScheduleEvent event) async* {
    if (event is FetchSchedule) {
      yield ScheduleLoading();
      try {
        ScheduleModel scheduleModel = await scheduleRepo.getSchedule(event.day);
        yield(ScheduleLoaded(scheduleModel));
      } catch (_) {
        yield ScheduleFailed();
      }
    }
    else if(event is RefreshSchedule) {
      yield ScheduleNotCalled();
    }
  }
}
