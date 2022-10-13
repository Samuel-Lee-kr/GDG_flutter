import 'package:flutter/material.dart';
import 'package:songdo_study/todo/screen/todo_screen.dart';

import '../../bmi/screen/bmi_screen.dart';
import '../../calculator/screen/calculator_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> selectedPage = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-- Area1 : body
      body: IndexedStack(
        index: _currentIndex,
        children: [
          CalculatorScreen(),
          BmiScreen(),
          TodoScreen(),
        ],
      ),
      //-- Area1 : bottomNavigationButton
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: 'BMI'),
          BottomNavigationBarItem(icon: Icon(Icons.next_plan), label: 'TODO'),
        ],
      ),
    );
  }
}
