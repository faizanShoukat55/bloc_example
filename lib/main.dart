import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/counter_example/bloc/counter_state.dart';
import 'package:flutter_bloc_example/counter_example/cubit_bloc/cubit_counter_cubit.dart';
import 'package:flutter_bloc_example/counter_example/ui/counter_screen.dart';
import 'package:flutter_bloc_example/counter_example/ui/counter_screen_cubit.dart';
import 'package:flutter_bloc_example/favourite_example/bloc/favourite_bloc.dart';
import 'package:flutter_bloc_example/favourite_example/cubit_bloc/cubit_favourite_cubit.dart';
import 'package:flutter_bloc_example/favourite_example/cubit_favourite_screen.dart';
import 'package:flutter_bloc_example/favourite_example/favourite_screen.dart';
import 'package:flutter_bloc_example/multiple_state_example/bloc/switch_bloc.dart';
import 'package:flutter_bloc_example/multiple_state_example/cubit_switch_screen.dart';
import 'package:flutter_bloc_example/multiple_state_example/cubity_bloc/cubit_switch_cubit.dart';
import 'package:flutter_bloc_example/repository/favourite_repository.dart';

import 'counter_example/bloc/counter_bloc.dart';
import 'multiple_state_example/switch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),

        BlocProvider(
          create: (context) => SwitchCubit(),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(FavouriteRepository()),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(FavouriteRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        //themeMode: ThemeMode.dark,
        theme: ThemeData(
          // brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CounterScreen()));
                }, child: const Text('Counter Example')),

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  const CounterScreenCubit()));
                }, child: const Text('Counter Cubit Example')),


            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SwitchScreen()));
                }, child: const Text('Switch Example')),


            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CubitSwitchScreen()));
                }, child: const Text('Cubit Switch Example')),

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavouriteAppScreen()));
                }, child: const Text('Favourite Example')),

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CubitFavouriteAppScreen()));
                }, child: const Text('Cubit Favourite Example')),
          ],
        ),
      ),
    );
  }
}
