import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/veggie.dart';
import './bloc/cart_bloc.dart';
import './bloc/cart_state.dart';
import './bloc/cart_event.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                state.veggieListy.length > 0
                    ? ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.veggieListy.length,
                        itemBuilder: (context, index) {
                          var namy = '${state.veggieListy[index]['name']}';
                          return ListTile(
                              leading: Image.network(
                                  '${state.veggieListy[index]['image_url']}'),
                              title: Text(namy),
                              subtitle: Row(
                                children: [
                                  Text(
                                      '${state.veggieListy[index]['quantity']}'),
                                  // Text('${state.veggieListy[index]['priceQuantity']}'),
                                  state.veggieListy[index]['quantity'] > 1 &&
                                          state.veggieListy[index]
                                                  ['quantity_type'] ==
                                              'unit'
                                      ? Text(' units')
                                      : Text(
                                          '${state.veggieListy[index]['quantity_type']}'),
                                  Text(
                                      '${state.veggieListy[index]['priceQuantity']}'),
                                  Text('*'),
                                  Text(
                                      '${state.veggieListy[index]['each_price']}'),
                                  Text(' = '),
                                  Text(
                                      '${state.veggieListy[index]['calcPrice']} rs'),
                                ],
                              ),
                              trailing: IconButton(
                                  color: Colors.red,
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    context.bloc<CartBloc>().add(
                                        DeleteCartEvent(Veggie.fromJson(
                                            state.veggieListy[index])));
                                    // _deleteProduct(
                                    //     context, state.veggieListy[index]['name']);
                                  }));
                        },
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text('Please add items to cart'),
                            GlowingOverscrollIndicator(
                                child: Text('Loaded'),
                                axisDirection: AxisDirection.left,
                                color: Colors.red)
                          ],
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
