import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test1/myHome.dart';

import './cart_event.dart';
import './cart_state.dart';
import './veggie.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial([], {"products": [], "orderCost": 0}, 0));

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is AddCartEvent) {
      Veggie item = event.veggie;
      int quantityAdded = event.quantityAdded;

      print('item, ${item}');
      print('quantity added:, ${quantityAdded}');

      print('veggie Listy, ${state.veggieListy}');

      // List<Veggie> newList = List.from(state.veggieListy);
      // newList.add(item);
      // List<Veggie> newList = [...state.veggieListy, _veg];

      if (state.veggieListy.length > 0) {
        var tempVegCart2 = state.veggieListy;

        // var myMap = Map<String, dynamic>.from(item);

        Map<String, dynamic> myItem = item.toMap();
        myItem['priceQuantity'] = quantityAdded;
        myItem['calcPrice'] = quantityAdded * myItem['each_price'];

        print('from addItem ITEM!! ...state.veggieListy : ${myItem}');
        // tempVegCart2.add(myItem);
        // var tempVegCart2 = [...state.veggieListy];
        print(
            'from addItem COunterCubit ...state.veggieListy 2: ${tempVegCart2}');

        var filteredMapy = tempVegCart2.firstWhere(
            (elem) => elem['name'] == item.name,
            orElse: () => null);

        print("*** Filtered MAP");
        print(filteredMapy);

        if (filteredMapy != null) {
          filteredMapy['quantity'] = filteredMapy['quantity'] + item.quantity;
          filteredMapy['priceQuantity'] =
              filteredMapy['priceQuantity'] + quantityAdded;

          // print('quanityt');

          // filteredMapy['quantity']);
          filteredMapy['calcPrice'] =
              filteredMapy['priceQuantity'] * filteredMapy['each_price'];

          var numList =
              tempVegCart2.map((elem) => elem['priceQuantity']).toList();

          var carty = numList.fold(0, (curr, next) => curr + next);
          List<dynamic> myArr =
              tempVegCart2.map((mapy) => mapy['calcPrice']).toList();

          int orderCost2 = myArr.fold(
              0, (previousValue, element) => previousValue + element);

          print('cart count:');
          print('state.cartCount');
          print('*****');
          print('complete cart');
          print('state.completeCart');
          Map<String, dynamic> completeAddCart = {
            "products": tempVegCart2,
            "orderCost": orderCost2
          };
          yield AfterAddState(tempVegCart2, completeAddCart, carty);

          ////
        } else {
          var tempVegCart1 = state.veggieListy;

          // var myMap = Map<String, dynamic>.from(item);
          // var quan = 0;
          Map<String, dynamic> myItem = item.toMap();
          myItem['priceQuantity'] = quantityAdded;
          myItem['calcPrice'] = quantityAdded * myItem['each_price'];

          print('Quantity Added, ${quantityAdded}');

          print('from addItem ITEM!! ...state.veggieListy : ${myItem}');
          tempVegCart1.add(myItem);
          print(
              'from addItem COunterCubit ...state.veggieListy 1: ${tempVegCart1}');

          var numList =
              tempVegCart1.map((elem) => elem['priceQuantity']).toList();

          var carty = numList.fold(0, (curr, next) => curr + next);

          List<dynamic> myArr =
              tempVegCart1.map((mapy) => mapy['calcPrice']).toList();

          int orderCost1 = myArr.fold(
              0, (previousValue, element) => previousValue + element);

          print('orderCost');
          print(state.completeCart['cost']);
          print('*****');
          print('complete cart');
          print(state.completeCart);
          Map<String, dynamic> completeAddCart = {
            "products": tempVegCart1,
            "orderCost": orderCost1
          };
          yield AfterAddState(tempVegCart1, completeAddCart, carty);
        }
      } else {
        var tempVegCart = state.veggieListy;

        // var myMap = Map<String, dynamic>.from(item);
        print('Quantity Added, ${quantityAdded}');

        Map<String, dynamic> myItem = item.toMap();
        myItem['priceQuantity'] = quantityAdded;
        myItem['calcPrice'] = quantityAdded * myItem['each_price'];

        print('from addItem ITEM!! ...state.veggieListy : ${myItem}');
        tempVegCart.add(myItem);

        var numList = tempVegCart.map((elem) => elem['priceQuantity']).toList();

        print('From Cart BLOC ==>>> ${numList}');

        var carty = numList.fold(0, (curr, next) => curr + next);

        List<dynamic> myArr =
            tempVegCart.map((mapy) => mapy['calcPrice']).toList();
        print(' myARR =>> , ${myArr}');

        int orderCost =
            myArr.fold(0, (previousValue, element) => previousValue + element);

        print(' OrderCost =>> , ${orderCost}');

        print('cart count:');
        print(state.cartCount);
        print(' tempVEGCART ==>> ${tempVegCart}');

        print('*****');

        Map<String, dynamic> completeAddCart = {
          "products": tempVegCart,
          "orderCost": orderCost
        };
        print('complete cart');
        print(state.completeCart);
        yield AfterAddState(tempVegCart, completeAddCart, carty);
      }
    } else if (event is DeleteCartEvent) {
      Veggie item = event.veggie;
      // int quantityAdded = event.quantityAdded;

      var denttempVegCart = state.veggieListy;

      Map<String, dynamic> myItem = item.toMap();

      denttempVegCart.removeWhere((veg) => veg['name'] == item.name);

      print('${denttempVegCart}');

      print(
          'from addItem COunterCubit ...state.veggieListy : ${denttempVegCart}');

      var numList =
          denttempVegCart.map((elem) => elem['priceQuantity']).toList();

      var carty = numList.fold(0, (curr, next) => curr + next);

      List<dynamic> myArr =
          denttempVegCart.map((mapy) => mapy['calcPrice']).toList();

      int orderCost =
          myArr.fold(0, (previousValue, element) => previousValue + element);

      print('cart count:');
      print(state.cartCount);
      print(carty);

      Map<String, dynamic> completeAddCart = {
        "products": denttempVegCart,
        "orderCost": orderCost
      };
      print('*****');
      print('complete cart');
      print(state.completeCart);
      yield AfterDeleteState(denttempVegCart, completeAddCart, carty);
    }
  }
}
