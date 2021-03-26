import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_demo/BlocProvider.dart';

class CounterPageFirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterStateFirst();
}

class _CounterStateFirst extends State<CounterPageFirst> {
  int _counter = 0;
  BlocProvider _provider;
  @override
  void initState() {
    _provider = Provider.of<BlocProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Page 1')),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                  stream: _provider.counterBloc.stream,
                  initialData: _counter,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _counter = snapshot.data;
                    }
                    return Text('$_counter', style: TextStyle(fontSize: 50));
                  },
                ),
                FlatButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CounterPageSecond())),
                  child: Text('Open the second page'),
                  color: Colors.grey[300],
                )
              ])),
      floatingActionButton: FloatingActionButton(
          child: Text('add'),
          onPressed: () => _provider.counterBloc.addToCounter()),
    );
  }
}

class CounterPageSecond extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterStateSecond();
}

class _CounterStateSecond extends State<CounterPageSecond> {
  int _counter = 0;
  var _provider;

  @override
  void initState() {
    _provider = Provider.of<BlocProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Page 2')),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                  stream: _provider.counterBloc.stream,
                  initialData: _counter,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _counter = snapshot.data;
                    }
                    return Text('$_counter', style: TextStyle(fontSize: 50));
                  },
                ),
              ])),
      floatingActionButton: FloatingActionButton(
          child: Text('add'),
          onPressed: () => _provider.counterBloc.addToCounter()),
    );
  }
}
