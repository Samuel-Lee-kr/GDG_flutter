import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GDG Flutter Study'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<String> _message = [
    '숫자를 더하거나 뺄수 있습니다.',
    '더 올라주세요!',
    '파랑색은 정말 싫어요. 망한거 같아요',
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _counter == 0 ? _message[0] : (_counter > 0 ? _message[1] : _message[2]),
            ),
            if (_counter > 0)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.arrow_upward_sharp, size: 30),
              ),
            if (_counter <= 0) const SizedBox(height: 10),
            Text(
              '$_counter',
              // style: Theme.of(context).textTheme.headline4,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: _counter == 0 ? Colors.black : (_counter > 0 ? Colors.red : Colors.blue),
              ),
            ),
            if (_counter < 0)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.arrow_downward_sharp, size: 30),
              ),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          const Spacer(),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _resetCounter,
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
