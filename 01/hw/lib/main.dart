import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samuel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),      
      // home: const MyHomePage(title: 'Samuel_GDG_First_HW'),
      home: const TestPage(title: 'test',)
    );
  }
}

class TestPage extends StatefulWidget {

  const TestPage({super.key, required this.title});
  final String title;

  @override
  State<TestPage> createState() => _TestPageState();

}

class _TestPageState extends State<TestPage> {

  var result = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Ink(
          child: InkWell(
            onTap: () {
              setState(() {
                result = testImgList();  
              });
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: result.isEmpty ? [const Text('아무것도 없습니다.')] : result
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> testImgList() {
      var result = <Widget>[];

      for(int i = 0; i < 7; i++) {
        result.add(Image(image: AssetImage('assets/images/img$i.jpg')));
      }
      return result;
    }

    Widget testImgListColumn() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: testImgList()
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
  double _fontSize = 16;

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
              'Value Control',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _counter < 0 ? Colors.red : Colors.black  
              ),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: _fontSize,
                color: _counter < 0 ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: _zeroCounter,
            tooltip: 'zero',
            child: const Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter > 10) {
      } else if (_counter < 1) {
        _fontSize = 16.0;
      } else {
        _fontSize = 16.0 * _counter;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter < 1) {
        _fontSize = 16;
      } else if (_counter > 10) {
        _fontSize = 16.0 * 10;
      } else {
        _fontSize = 16.0 * _counter;
      }
    });
  }

  void _zeroCounter() {
    setState(() {
      _counter = 0;
      _fontSize = 16.0;
    });
  }
}
