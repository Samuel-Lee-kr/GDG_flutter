import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:songdo_study/todo/model/data/init_data.dart';
import 'package:songdo_study/todo/model/todoModel.dart';
import 'package:songdo_study/todo/screen/todo_detail.dart';

// import 'package:songdo_study/todo/screen/todo_detail.damport '
// import 'package:songdo_study/todo/screen/todo_detail.dart';../model/todoModel.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoModel> _todoList = InitData.todoList;
  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return listItemCard(_todoList[index]);
              },
            ),
          ),
          //-------------------------------------------- textFieldWidget + add button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 35,
                    child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: _todoController,
                        decoration: InputDecoration(
                          hintText: 'Title',
                          border: OutlineInputBorder(),
                        )),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_todoController.text.isNotEmpty) {
                      _todoList.add(
                        TodoModel(
                          title: _todoController.text,
                          content: 'Content100',
                          addTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          isCompleted: false,
                        ),
                      );
                      _todoController.text = '';
                      setState(() {});
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Add'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listItemCard(TodoModel todoModel) {
    final today = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    final String addTimeText;
    if (todoModel.addTime == null) {
      addTimeText = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(
        Duration(days: 365),
      ));
    } else {
      addTimeText = todoModel.addTime!;
    }
    final todoDay = DateTime.parse(addTimeText);
    final int isPassed = today.compareTo(todoDay);

    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          TextEditingController _detailController =
              TextEditingController(text: todoModel.content);
          bool? _isCompleted = todoModel.isCompleted;

          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(todoModel.title!),
                content: TextFormField(
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: _detailController,
                  // chk : controller 와 initialValue 는 동시에 사용 못한다.
                  // initialValue: todoModel.content,
                  decoration: InputDecoration(
                    hintText: 'None',
                    border: OutlineInputBorder(),
                  ),
                ),
                actions: [
                  Text('완료:'),
                  Checkbox(
                    value: _isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCompleted = value!;
                      });
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop('delete');
                        setState(() {
                          _todoList.remove(todoModel);
                        });
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop('update');
                        setState(() {
                          todoModel.content = _detailController.text;
                          todoModel.isCompleted = _isCompleted;
                        });
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )),
                ],
              );
            },
          );
        },
        onLongPress: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => TodoDetailScreen(todoModel: todoModel),
            ),
          );

          // 되나 해보자
          if (todoModel.stateCheck == 'delete') {
            customSetState('delete', todoModel, result);
          } else {
            customSetState('update', todoModel, result);
          }
        },
        title: Text(
          todoModel.title!,
          style: customTextStyle(isPassed, todoModel),
        ),
        subtitle: Row(
          children: [
            Text(
              todoModel.addTime ?? '기한 없음',
              style: customTextStyle(isPassed, todoModel),
            ),
            SizedBox(width: 10),
            Text(
              todoModel.content!,
              style: customTextStyle(isPassed, todoModel),
            ),
          ],
        ),
        trailing: todoModel.isCompleted == false
            ? Icon(Icons.check_box_outline_blank)
            : Icon(Icons.check_box),
      ),
    );
  }

  void customSetState(
    String? isUpdateDelete,
    TodoModel? todoModel,
    TodoModel? result,
  ) {
    if (isUpdateDelete == 'update') {
      todoModel!.isCompleted = result!.isCompleted;
      todoModel.content = result.content;
    } else {
      _todoList.remove(todoModel);
    }

    setState(() {});
  }

  TextStyle customTextStyle(
    int isPassed,
    TodoModel todoModel,
  ) {
    return TextStyle(
      color: isPassed == 1 ? Colors.red : Colors.black,
      fontWeight: isPassed == 1 ? FontWeight.w600 : FontWeight.w400,
      decoration:
          todoModel.isCompleted! ? TextDecoration.lineThrough : TextDecoration.none,
      fontStyle: todoModel.isCompleted! ? FontStyle.italic : FontStyle.normal,
    );
  }
}
