import 'package:equatable/equatable.dart';

abstract class ScheduleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSchedule extends ScheduleEvent {
  final day;//should be private? i.e. _day?

  FetchSchedule(this.day);

  @override
  List<Object> get props => [day];

}

class RefreshSchedule extends ScheduleEvent {}
