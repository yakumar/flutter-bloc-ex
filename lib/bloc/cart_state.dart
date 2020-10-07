import './cart_bloc.dart';
import 'package:equatable/equatable.dart';
import './veggie.dart';

abstract class CartState extends Equatable {
  final List<Map> veggieListy;
  final Map<String, dynamic> completeCart;
  final int cartCount;

  const CartState(this.veggieListy, this.completeCart, this.cartCount);

  @override
  List<Object> get props => [veggieListy, completeCart, cartCount];
}

class CartInitial extends CartState {
  final List<Map> veggieListy = [];
  final int cartCount = 0;
  final Map<String, dynamic> completeCart = {"products": [], "orderCost": 0};

  CartInitial(
      List<Map> veggieListy, Map<String, dynamic> completeCart, int cartCount)
      : super(veggieListy, completeCart, cartCount);
}

class AfterAddState extends CartState {
  // final List<Veggie> veggieListy;
  //   final Map<String, dynamic> completeCart;

  AfterAddState(
      List<Map> veggieListy, Map<String, dynamic> completeCart, int cartCount)
      : super(veggieListy, completeCart, cartCount);
}

class AfterDeleteState extends CartState {
  AfterDeleteState(
      List<Map> veggieListy, Map<String, dynamic> completeCart, int cartCount)
      : super(veggieListy, completeCart, cartCount);
}
