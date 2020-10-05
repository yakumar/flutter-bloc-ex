part of 'bloccounter_bloc.dart';

abstract class BloccounterState extends Equatable {
  final int count;
  BloccounterState(this.count);

  @override
  List<Object> get props => [count];
}

class BloccounterInitial extends BloccounterState {
  @override
  final int count = 0;
  BloccounterInitial() : super(0);
}

class BlocIncremented extends BloccounterState {
  @override
  final int count;
  BlocIncremented(this.count) : super(count);
}

class BlocDecremented extends BloccounterState {
  @override
  final int count;
  BlocDecremented(this.count) : super(count);
}
