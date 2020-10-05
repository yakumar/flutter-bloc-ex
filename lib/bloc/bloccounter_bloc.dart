import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloccounter_event.dart';
part 'bloccounter_state.dart';

class BloccounterBloc extends Bloc<BloccounterEvent, BloccounterState> {
  BloccounterBloc() : super(BloccounterInitial());

  @override
  Stream<BloccounterState> mapEventToState(
    BloccounterEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is IncrementEvent) {
      print('incremented');
      print('state, ${state}');

      var county = state.count;
      county--;

      yield BlocIncremented(state.count + 1);
    } else if (event is DecrementEvent) {
      // BloccounterState county = state.count as BloccounterState;
      // county--;
      print('Decremented');
      var county = state.count;

      county--;
      // var county = state.count;
      yield BlocDecremented(county);
    }
  }
}
