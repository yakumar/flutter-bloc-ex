import './item.dart';
//
import 'package:equatable/equatable.dart';

abstract class ListblocEvent extends Equatable {
  const ListblocEvent();

  @override
  List<Object> get props => [];
}

class AddToListEvent extends ListblocEvent {
  final Item item;

  AddToListEvent(this.item);
}

class RemoveFromListEvent extends ListblocEvent {
  final Item item;

  RemoveFromListEvent(this.item);
}
