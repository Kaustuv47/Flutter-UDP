import 'dart:convert';
import 'dart:io';

void send () {
  var ddtt = {'id':"iigg"};
  var data = "A";
  var codec = new Utf8Codec();
  List<int> dataToSend = codec.encode(data);
  var addressesIListenFrom = InternetAddress.tryParse('192.168.0.255');
  int portIListenOn = 23546;
  RawDatagramSocket.bind(addressesIListenFrom, portIListenOn).then((RawDatagramSocket udpSocket) {
    udpSocket.broadcastEnabled = true;
    udpSocket.forEach((RawSocketEvent event) {
      if(event == RawSocketEvent.read) {
        Datagram dg = udpSocket.receive();
        dg.data.forEach((x) => print(x));
      }
    });
    udpSocket.send(json.encoder(), addressesIListenFrom, portIListenOn);
    print('Did send data on the stream..');
  });
}
