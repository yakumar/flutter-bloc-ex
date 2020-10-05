import 'package:flutter/material.dart';
import './bloc/bloccounter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/listbloc_bloc.dart';
import 'bloc/listbloc_state.dart';
import './bloc/listbloc_event.dart';
import './bloc/item.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController _controller;

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
      appBar: AppBar(
        title: Text('App Bloc'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              BlocBuilder<BloccounterBloc, BloccounterState>(
                builder: (context, state) {
                  return Text('${state.count}');
                },
              ),
              RaisedButton(
                onPressed: () =>
                    context.bloc<BloccounterBloc>().add(IncrementEvent()),
                child: Icon(Icons.add),
              ),
              RaisedButton(
                  onPressed: () =>
                      context.bloc<BloccounterBloc>().add(DecrementEvent()),
                  child: Icon(Icons.remove)),
              Container(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add',
                      suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => _controller.clear())),
                  onChanged: (val) {
                    setState(() {
                      valS = val;
                    });
                  },
                  onSubmitted: (val) {
                    print('val from input: ${val}');
                    // Item item =

                    context.bloc<ListblocBloc>().add(AddToListEvent(Item(val)));

                    setState(() {
                      _controller.text = '';
                    });
                  },
                ),
              ),
              BlocBuilder<ListblocBloc, ListblocState>(
                builder: (context, state) {
                  return Text('${state.itemList.length}');
                },
              ),
              BlocBuilder<ListblocBloc, ListblocState>(
                builder: (context, state) {
                  return state.itemList.length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.itemList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text('${state.itemList[index].title}'),
                            );
                          })
                      : CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
