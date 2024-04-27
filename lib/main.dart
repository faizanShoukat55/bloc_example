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
import 'package:flutter_bloc_example/singleton/singleton_example.dart';

import 'counter_example/bloc/counter_bloc.dart';
import 'factory_pattern/factory_pattern.dart';
import 'multiple_state_example/switch_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'dart:io';
import 'dart:async';

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
        title: 'Flutter Bloc example',
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
                },
                child: const Text('Counter Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CounterScreenCubit()));
                },
                child: const Text('Counter Cubit Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SwitchScreen()));
                },
                child: const Text('Switch Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CubitSwitchScreen()));
                },
                child: const Text('Cubit Switch Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavouriteAppScreen()));
                },
                child: const Text('Favourite Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CubitFavouriteAppScreen()));
                },
                child: const Text('Cubit Favourite Example')),
            ElevatedButton(
                onPressed: () async {
                  MySocket instance1 = MySocket.getInstance();
                  MySocket instance2 = MySocket.getInstance();
                  print(
                      "Both instances are same : ${identical(instance1, instance2)}");

                  IO.Socket? instance3 =
                      await MySocketWithoutFactoryMethod.getSocket();
                  IO.Socket? instance4 =
                      await MySocketWithoutFactoryMethod.getSocket();

                  print(
                      "Both instances are same : ${identical(instance3, instance4)}");
                },
                child: const Text('Singleton and Factory Method Example')),


            ElevatedButton(
                onPressed: () async {
                  //get shape factory
                  AbstractFactory shapeFactory = FactoryProducer.getFactory(false);

                  //get an object of Shape Rectangle
                  Shape? shape1 = shapeFactory.getShape("RECTANGLE");
                  //call draw method of Shape Rectangle
                  shape1!.draw(); //Prints "Rectangle"
                  //get an object of Shape Square
                  Shape? shape2 = shapeFactory.getShape("SQUARE");
                  //call draw method of Shape Square
                  shape2!.draw(); //Prints "SQUARE"
                  //get shape factory
                  AbstractFactory shapeFactory1 = FactoryProducer.getFactory(true);
                  //get an object of Shape RoundedRectangle
                  Shape? shape3 = shapeFactory1.getShape("RECTANGLE");
                  //call draw method of Shape RoundedRectangle
                  shape3!.draw(); //Prints "RoundedRectangle"
                  //get an object of Shape RoundedSquare
                  Shape? shape4 = shapeFactory1.getShape("Square");
                  //call draw method of Shape RoundedSquare
                  shape4!.draw(); //Prints "RoundedSquare"
                  },
                child: const Text('Abstract Factory Method Example')),
          ],
        ),
      ),
    );
  }
}






class WebSocketManager {
  static WebSocketManager? _instance;
  WebSocket? _webSocket;
  final String _serverUrl = 'wss://example.com/ws';

  // Private constructor
  WebSocketManager._();

  // Factory method to get or create the singleton instance
  factory WebSocketManager.getInstance() {
    _instance ??= WebSocketManager._();
    return _instance!;
  }

  // Method to connect to the WebSocket server
  Future<void> connect() async {
    try {
      _webSocket = await WebSocket.connect(_serverUrl);
      print('Connected to WebSocket server');
    } catch (e) {
      print('Error connecting to WebSocket server: $e');
    }
  }


  void receiveMessage(String message) {
    if (_webSocket != null && _webSocket!.readyState == WebSocket.open) {
      //_webSocket!.add(message);

      print('Sent message: $message');
    } else {
      print('WebSocket connection not open.');
    }
  }

  // Method to send a message to the WebSocket server
  void sendMessage(String message) {
    if (_webSocket != null && _webSocket!.readyState == WebSocket.open) {
      _webSocket!.add(message);
      print('Sent message: $message');
    } else {
      print('WebSocket connection not open.');
    }
  }

  // Method to close the WebSocket connection
  void closeConnection() {
    if (_webSocket != null && _webSocket!.readyState == WebSocket.open) {
      _webSocket!.close();
      print('Closed WebSocket connection');
    }
  }
}

// void main() async {
//   // Using the WebSocketManager to connect and send messages
//   WebSocketManager manager = WebSocketManager.getInstance();
//   await manager.connect();
//
//   // Sending a message
//   manager.sendMessage('Hello, WebSocket!');
//
//   // Closing the WebSocket connection
//   manager.closeConnection();
// }

