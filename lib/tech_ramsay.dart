import 'dart:convert';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io';

import 'package:socket_io_common/src/util/event_emitter.dart';

class TechRamsay {
  static TechRamsay? masterChef;

  IO.Socket socket;
  TechRamsay({
    required this.socket,
  }) {
    socket.onConnect((dynamic) {
      print('connected!!');
  } as EventHandler);
  }

  void cook(File imageFile) {
    String base64Image = _getImageStringEncoding(imageFile);
    socket.emit('cook', [base64Image]);
    socket.emit('cook-result', ['haha']);
    print("????");
  }

  void personalize(Map<String, dynamic> preferences) { // doesn't need image, but will generate a new one 
    socket.emit('personalize', [json.encode(preferences)]);
  }

  String _getImageStringEncoding(File imageFile) {
    return base64Encode(imageFile.readAsBytesSync());
  }
}