import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/bloc/cart_bloc.dart';
import 'package:test1/counter_observer.dart';
import './providers.dart';
import 'package:bloc/bloc.dart';
import 'counter_view.dart';
import './counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './myHome.dart';
import './bloc/bloccounter_bloc.dart';
import 'bloc/listbloc_bloc.dart';
import './cart.dart';

void main() {
  Bloc.observer = SimpleObserver();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ListblocBloc>(create: (_) => ListblocBloc()),
          BlocProvider<BloccounterBloc>(create: (_) => BloccounterBloc()),
          BlocProvider<CartBloc>(create: (_) => CartBloc()),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => MyHome(),
            '/cart': (context) => Cart(),
          },
        ));
  }
}
