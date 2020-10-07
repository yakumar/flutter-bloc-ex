import 'package:equatable/equatable.dart';
import './item.dart';

abstract class ListblocState extends Equatable {
  final List<Item> itemList;

  const ListblocState(this.itemList);

  @override
  List<Object> get props => [itemList];
}

class ListblocInitial extends ListblocState {
  final List<Item> itemList = [];
  ListblocInitial(List<Item> itemList) : super(itemList);
}

class AddItemState extends ListblocState {
  // final List<Item> itemList;

  AddItemState(List<Item> itemList) : super(itemList);
}

class RemoveItemState extends ListblocState {
  RemoveItemState(List<Item> itemList) : super(itemList);
}

// class Item extends Equatable {
//   final String title;

//   @override
//   // TODO: implement props
//   List<Object> get props => [title];

//   Item(this.title);

//   Item copyWith({String title}) {
//     return Item(title ?? this.title);
//   }
// }
