import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider((ref) => 20);

class Counter extends StateNotifier<int> {
  Counter() : super(22);
  void increment() {
    print('incremented');
    state++;
  }

  void decrease() {
    print('decreaseeee');
    state--;
  }
}

final stateCountProvider = StateNotifierProvider((ref) => Counter());
