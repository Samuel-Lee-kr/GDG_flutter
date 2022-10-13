import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoModel {
  final String title;
  String content;
  String? addTime;
  bool isCompleted;

  TodoModel({
    required this.title,
    required this.content,
    this.addTime,
    required this.isCompleted,
  });
}
