import 'package:equatable/equatable.dart';

class Item extends Equatable {
  String title;

  @override
  // TODO: implement props
  List<Object> get props => [title];

  Item(this.title);

  Item copyWith({String title}) {
    return Item(title ?? this.title);
  }
  // factory Item.toTitle(String title): title = title;
}
