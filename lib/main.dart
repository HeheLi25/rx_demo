import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_demo/BlocProvider.dart';
import 'package:rx_demo/counter/Counter.dart';
import 'package:rx_demo/counter/CounterBloc.dart';
import 'package:rx_demo/messages/Message.dart';

void main() {
  runApp(Provider<BlocProvider>(
      child: MyApp(), create: (_) => BlocProvider()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Counter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CounterPageFirst()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Message',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
                onTap: () {
                   Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MessagePageFirst()));
                },
              ),
              Divider(),
            ],
          ),
        ));
  }
}
