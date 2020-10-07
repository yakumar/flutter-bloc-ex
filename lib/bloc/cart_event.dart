import 'package:equatable/equatable.dart';
import './veggie.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddCartEvent extends CartEvent {
  final Veggie veggie;
  final int quantityAdded;

  AddCartEvent(this.veggie, this.quantityAdded);
}

class DeleteCartEvent extends CartEvent {
  final Veggie veggie;
  // final int quantityAdded;

  DeleteCartEvent(this.veggie);
}
