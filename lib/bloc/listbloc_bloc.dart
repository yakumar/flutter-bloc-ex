import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import './listbloc_event.dart';
import './listbloc_state.dart';
import './item.dart';

class ListblocBloc extends Bloc<ListblocEvent, ListblocState> {
  ListblocBloc() : super(ListblocInitial([]));

  @override
  Stream<ListblocState> mapEventToState(
    ListblocEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is AddToListEvent) {
      Item item = event.item;

      List<Item> newList = [...state.itemList];

      newList.add(item);

      yield AddItemState(newList);
    } else if (event is RemoveFromListEvent) {
      Item removeItem = event.item;
      print(removeItem.title);

      List<Item> newList = [...state.itemList]
          .where((element) => element.title != removeItem.title)
          .toList();

      yield RemoveItemState(newList);
    }
  }
}
