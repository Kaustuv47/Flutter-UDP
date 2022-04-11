// import 'dart:async';
// import 'dart:io';
//
// class SocketUDP {
//   RawDatagramSocket _socket;
//
//   // the port used by this socket
//   int _port;
//
//   // emit event when receive a new request. Emit the request
//   StreamController<Request> _onRequestReceivedCtrl = StreamController<Request>.broadcast();
//
//   // to give access of the Stream to listen when new request is received
//   Stream<Request> get onRequestReceived => _onRequestReceivedCtrl.stream;
//
//   // as singleton to maintain the connexion during the app life and be accessible everywhere
//   static final SocketUDP _instance = SocketUDP._internal();
//
//   factory SocketUDP() {
//     return _instance;
//   }
//
//   SocketUDP._internal();
//
//   void startSocket(int port) {
//
//     _port = port;
//
//     RawDatagramSocket.bind(InternetAddress.anyIPv4, _port)
//         .then((RawDatagramSocket socket) {
//       _socket = socket;
//       // listen the request from server
//       _socket.listen((e) {
//         Datagram dg = _socket.receive();
//         if (dg != null) {
//           _onRequestReceivedCtrl.add(RequestConvert.decodeRequest(dg.data, dg.address));
//         }
//       });
//     });
//   }