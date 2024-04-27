import 'package:socket_io_client/socket_io_client.dart' as IO;

class MySocket {
  static MySocket? _instance;
  IO.Socket? _socket;

  MySocket._();

  factory MySocket.getInstance() {
    _instance ??= MySocket._();
    return _instance!;
  }

  // Method to connect to the WebSocket server
  Future<void> connect() async {
    try {
//      _socket = await WebSocket.connect(_serverUrl);
      _socket = IO.io(
          'live url',
          IO.OptionBuilder()
              .setTimeout(30000)
              .enableAutoConnect()
              .enableMultiplex()
              .setTransports(["websocket"])
              .setReconnectionAttempts(200)
              .setReconnectionDelay(5000)
              .build());

      _socket?.onConnect((_) {
        print('Connected to WebSocket server');
      });
    } catch (e) {
      print('Error connecting to WebSocket server: $e');
    }
  }

  Future<String>? receiveData() {
    _socket?.on('receive', (data) {
      print("Socket Data Event :" + data.toString());
      return data.toString();
    });
  }


  Future<void> closeSocket() async {
    _socket?.close();
  }

}

class MySocketWithoutFactoryMethod{

  static IO.Socket? _socket;

  static _init() async {
    // String? jwt = await AppPref().getJWT();
    String? jwt = "";
    _socket = IO.io(

        'http:8001?token=$jwt',
        IO.OptionBuilder()
            .setTimeout(30000)
            .enableAutoConnect()
            .enableMultiplex()
            .setTransports(["websocket"])
            .setReconnectionAttempts(200)
            .setReconnectionDelay(5000)
            .build());

    _socket?.onConnect((_) {
      print('connect');
    });

    _socket?.onConnectError(
            (data) => print('error :${data.toString()}'));
    // event
    _socket?.on('receive', (data) {
      print("Socket Data Event :" + data.toString());
    });
    _socket?.onDisconnect(
            (_) => print('disconnected'));
    _socket?.on('fromServer', (_) => print(_));

    return _socket!;
  }

  static getSocket() {
    if (_socket != null) {
      return _socket!;
    }
    return _init();
  }

  // /// Private Static Instance
  // static MySocketWithoutFactoryMethod? _instance;
  //
  // /// Private Constructor
  // MySocketWithoutFactoryMethod._();
  //
  // /// Factory Method to get the same instance
  // factory MySocketWithoutFactoryMethod.getInstance() {
  //   _instance ??= MySocketWithoutFactoryMethod._();
  //   return _instance!;
  // }
}
