import 'package:intl/intl.dart';
import '../todoModel.dart';

class InitData{
  InitData._();

  static final List<TodoModel> todoList = [
    TodoModel(
        title: 'Title1',
        content: 'Content1',
        addTime:
        DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1))),
        isCompleted: false),
    TodoModel(
        title: 'Title2',
        content: 'Content2',
        addTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        isCompleted: true),
    TodoModel(
        title: 'Title3',
        content: 'Content3',
        addTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        isCompleted: false),
    TodoModel(
        title: 'Title4',
        content: 'Content4',
        addTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        isCompleted: true),
    TodoModel(
        title: 'Title5',
        content: 'Content5',
        // addTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        isCompleted: false),
    TodoModel(
        title: 'Title6',
        content: 'Content6',
        addTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        isCompleted: false),
    TodoModel(
        title: 'Title7',
        content: 'Content7',
        addTime:
        DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1))),
        isCompleted: false),
    TodoModel(
        title: 'Title8',
        content: 'Content8',
        addTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        isCompleted: false),
    TodoModel(
        title: 'Title9',
        content: 'Content9',
        addTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        isCompleted: false),
  ];
}