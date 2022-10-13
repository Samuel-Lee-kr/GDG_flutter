import 'package:flutter/material.dart';
import 'package:songdo_study/widgets/nav_bar.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreen();
}

class _CalculatorScreen extends State<CalculatorScreen> {
  int _counter = 0;
  final List<String> _message = [
    '숫자를 더하거나 뺄수 있습니다.',
    '더 올라주세요!',
    '파랑색은 정말 싫어요. 망한거 같아요',
  ];

  //-- 숫자 증가
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //-- 숫자 감소
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  //-- 숫자 초기화 (0으로 세팅)
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),

      appBar: AppBar(
        title: Text("Calculator App"),
        centerTitle: true,
      ),

      //-- area1 : body
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
                color: _counter == 0
                    ? Colors.black
                    : (_counter > 0 ? Colors.red : Colors.blue),
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
      //-- area1 : floatingActionButton
      floatingActionButton: Column(
        children: [
          const Spacer(),
          FloatingActionButton(
            heroTag: '+',
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '-',
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '0',
            onPressed: _resetCounter,
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
