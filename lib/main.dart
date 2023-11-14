import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  final CounterModel model;

  CounterView({required this.model});

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: Text("Kione's Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count:',
            ),
            Text(
              '${widget.model.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.model.incrementCounter();
              });
            },
            tooltip: 'Add',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 18),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.model.decrementCounter();
              });
            },
            tooltip: 'Subtract',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterModel {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
  }

  void decrementCounter() {
    _counter--;
  }
}

class CounterController {
  CounterModel _model = CounterModel();

  CounterModel get model => _model;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterController _controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kione Counter App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CounterView(model: _controller.model),
    );
  }
}
