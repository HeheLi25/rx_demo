import 'dart:async';

import 'package:rxdart/subjects.dart';

class MessageBloc {
  List<String> _messageList = [];

  ReplaySubject<String> _messageController = ReplaySubject<String>();
  Stream<String> get stream => _messageController.stream;

  void sendMessage(String message) {
    _messageController.sink.add(message);
    _messageList.add(message);
  }

  void closeSink() {
    _messageController.close();
  }
}
