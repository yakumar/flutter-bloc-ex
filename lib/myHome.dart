import 'package:flutter/material.dart';
import 'package:test1/bloc/cart_bloc.dart';
import './bloc/bloccounter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/listbloc_bloc.dart';
import 'bloc/listbloc_state.dart';
import './bloc/listbloc_event.dart';
import './bloc/item.dart';
import './bloc/veggie.dart';
import './bloc/cart_state.dart';
import './bloc/cart_event.dart';

List<Veggie> veggieList = [
  Veggie(
    name: "Tomato",
    category: "vegetables",
    each_price: 20,
    quantity: 100,
    quantity_type: "grams",
    veggram_id: 11,
    image_url:
        "https://m.economictimes.com/thumb/msid-65605495,width-640,height-480,resizemode-4,imgsize-194822/bccl-tomatoes.jpg",
  ),
  Veggie(
    name: "Brinjal",
    category: "vegetables",
    each_price: 37,
    quantity: 200,
    quantity_type: "grams",
    veggram_id: 12,
    image_url: "https://im.rediff.com/300-300/money/2010/jan/27brinjal1.jpg",
  ),
  Veggie(
    name: "Mango",
    category: "fruits",
    each_price: 100,
    quantity: 3,
    quantity_type: "units",
    veggram_id: 14,
    image_url:
        "https://images-na.ssl-images-amazon.com/images/I/41TU0J4eRgL._SX466_.jpg",
  ),
];

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController _controller;

  int quantityAdded = 0;

  String valS = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('App Bloc'),
        actions: [
          Stack(
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Text('${state.cartCount}');
                },
              ),
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cart');
                  }),
            ],
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              // BlocBuilder<BloccounterBloc, BloccounterState>(
              //   builder: (context, state) {
              //     return Text('${state.count}');
              //   },
              // ),
              // RaisedButton(
              //   onPressed: () =>
              //       context.bloc<BloccounterBloc>().add(IncrementEvent()),
              //   child: Icon(Icons.add),
              // ),
              // RaisedButton(
              //     onPressed: () =>
              //         context.bloc<BloccounterBloc>().add(DecrementEvent()),
              //     child: Icon(Icons.remove)),
              // Container(
              //   height: 10.0,
              // ),
              // Container(
              //   padding: EdgeInsets.all(10.0),
              //   child: TextField(
              //     controller: _controller,
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'Add',
              //         suffixIcon: IconButton(
              //             icon: Icon(Icons.clear),
              //             onPressed: () => _controller.clear())),
              //     onChanged: (val) {
              //       setState(() {
              //         valS = val;
              //       });
              //     },
              //     onSubmitted: (val) {
              //       print('val from input: ${val}');
              //       // Item item =

              //       context.bloc<ListblocBloc>().add(AddToListEvent(Item(val)));

              //       setState(() {
              //         _controller.text = '';
              //       });
              //     },
              //   ),
              // ),
              // BlocBuilder<ListblocBloc, ListblocState>(
              //   builder: (context, state) {
              //     return Text('${state.itemList.length}');
              //   },
              // ),
              // BlocBuilder<ListblocBloc, ListblocState>(
              //   builder: (context, state) {
              //     return state.itemList.length > 0
              //         ? ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: state.itemList.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               return ListTile(
              //                 title: Text('${state.itemList[index].title}'),
              //                 trailing: IconButton(
              //                     icon: Icon(Icons.clear),
              //                     onPressed: () => context
              //                         .bloc<ListblocBloc>()
              //                         .add(RemoveFromListEvent(
              //                             state.itemList[index]))),
              //               );
              //             })
              //         : CircularProgressIndicator();
              //   },
              // ),
              SingleChildScrollView(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 7.0,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            MediaQuery.of(context).size.height *
                            1.2),
                    // displayWidth(context) / displayHeight(context) * 1.5),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: veggieList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var veg = veggieList[index];
                      return Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 9,
                          child: Column(
                            children: [
                              Container(child: Image.network(veg.image_url)),
                              Text(veg.each_price.toString()),
                              Text(veg.quantity.toString()),
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    quantityAdded++;
                                  });
                                  context
                                      .bloc<CartBloc>()
                                      .add(AddCartEvent(veg, quantityAdded));

                                  setState(() {
                                    quantityAdded = 0;
                                  });
                                },
                                child: Icon(Icons.add),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
