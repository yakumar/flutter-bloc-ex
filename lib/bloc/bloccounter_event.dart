part of 'bloccounter_bloc.dart';

abstract class BloccounterEvent extends Equatable {
  BloccounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends BloccounterEvent {
  // final int count;
  IncrementEvent() : super();
}

class DecrementEvent extends BloccounterEvent {
  DecrementEvent() : super();
}
