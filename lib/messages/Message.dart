import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_demo/BlocProvider.dart';

class MessagePageFirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageStateFirst();
}

class _MessageStateFirst extends State<MessagePageFirst> {
  List<String> _messageList = [];
  BlocProvider _provider;
  TextEditingController _controller = TextEditingController();
  StreamSubscription _subscription;
  @override
  void initState() {
    _provider = Provider.of<BlocProvider>(context, listen: false);
    _subscription = _provider.messageBloc.stream.listen((event) {
      setState(() {
        _messageList.add(event);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message Page 1')),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // StreamBuilder(
                //   stream: _provider.messageBloc.stream,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       _messageList.add(snapshot.data);
                //     }
                //     return _buildMessagePanel(_messageList);
                //   },
                // ),
                _buildMessagePanel(_messageList),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                        decoration: InputDecoration(labelText: 'send message'),
                        controller: _controller,
                        onSubmitted: (message) {
                          _provider.messageBloc.sendMessage(
                              '[${DateTime.now().toString().split('.')[0]}] $message');
                          _controller.clear();
                        })),
                FlatButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MessagePageSecond())),
                  child: Text('Open the second page'),
                  color: Colors.grey[300],
                )
              ])),
    );
  }
}

class MessagePageSecond extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageStateSecond();
}

class _MessageStateSecond extends State<MessagePageSecond> {
  List<String> _messageList = [];
  BlocProvider _provider;
  TextEditingController _controller = TextEditingController();
  StreamSubscription _subscription;

  @override
  void initState() {
    _provider = Provider.of<BlocProvider>(context, listen: false);
    _subscription = _provider.messageBloc.stream.listen((event) {
      setState(() {
        _messageList.add(event);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message Page 2')),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // StreamBuilder(
                //   stream: _provider.messageBloc.stream,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       _messageList.add(snapshot.data);
                //     }
                //     return _buildMessagePanel(_messageList);
                //   },
                // ),
                _buildMessagePanel(_messageList),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                        decoration: InputDecoration(labelText: 'send message'),
                        controller: _controller,
                        onSubmitted: (message) {
                          _provider.messageBloc.sendMessage(
                              '[${DateTime.now().toString().split('.')[0]}] $message');
                          _controller.clear();
                        })),
              ])),
    );
  }
}

Widget _buildMessagePanel(List<String> messageList) {
  return Container(
      height: 500,
      width: 500,
      child: SingleChildScrollView(
        child: Column(
          children: messageList.map((e) => Text(e)).toList(),
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ));
}
