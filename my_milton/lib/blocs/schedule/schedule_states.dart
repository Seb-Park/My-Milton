import 'package:equatable/equatable.dart';
import 'package:my_milton/models/schedule_model.dart';

abstract class ScheduleState extends Equatable {
  @override
  List<Object> get props => [];
}

class ScheduleNotCalled extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final ScheduleModel loadedSchedule;
  ScheduleLoaded(this.loadedSchedule);
}

class ScheduleFailed extends ScheduleState {}