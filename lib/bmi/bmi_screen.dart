import 'package:flutter/material.dart';

import 'bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  // int _currentIndex = 0;
  List<String> _hintText = [
    "속이지 말고 정확하게 입력합시다. -_-;;",
    "몸무게 속이지 말라고 했다. 다시 적어라!!",
  ];

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  int _heightValue = 0;
  int _weightValue = 0;
  double _bmiValue = 0;

  String _gender = "남성";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator App",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),

      //-- area1 : body
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  decoration: InputDecoration(
                      hintText: _hintText[0],
                      labelText: '키(cm)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              SizedBox(height: 20),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  decoration: InputDecoration(
                      hintText: _hintText[1],
                      labelText: '몸무게(kg)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              SizedBox(height: 20),
              RadioListTile(
                title: Text("남성"),
                value: "남성",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              RadioListTile(
                title: Text("여성"),
                value: "여성",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_heightController.text.isEmpty || _weightController.text.isEmpty) {
                    return;
                  }

                  _heightValue = int.parse(_heightController.text);
                  _weightValue = int.parse(_weightController.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BmiResultScreen(
                                height: _heightValue,
                                weight: _weightValue,
                                gender: _gender,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                  child: Text(
                    // "${_heightValue}  :  ${_weightValue}",
                    "클릭하세요",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
