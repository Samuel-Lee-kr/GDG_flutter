import 'package:flutter/material.dart';

class BmiResultScreen extends StatefulWidget {
  final int height;
  final int? weight;

  const BmiResultScreen({
    Key? key,
    required this.height,
    this.weight = 0,
  }) : super(key: key);

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '${widget.height}  /  ${widget.weight}'
        ),
      ),
    );
  }
}
