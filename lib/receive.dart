import 'dart:convert';
import 'dart:io';


Future<void> recieve () async {
  var bindAddress = InternetAddress.anyIPv4;
  int bindPort = 23546; //0 is random
  RawDatagramSocket.bind(bindAddress, bindPort).then((RawDatagramSocket udpSocket) {
    udpSocket.broadcastEnabled = true;
    udpSocket.forEach((RawSocketEvent event) {
      // print(RawSocketEvent.read.toString());
      var data = "";
      if(event == RawSocketEvent.read) {
        Datagram dg = udpSocket.receive();
        dg.data.forEach((x) => {data = data + String.fromCharCode(x)});
        print(data);
      }
    });
  });
}