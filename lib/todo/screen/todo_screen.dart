import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:songdo_study/todo/screen/todo_detail.dart';
import '../model/todoModel.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key, this.isUpdateDelete, this.customSetState}) : super(key: key);

  final String? isUpdateDelete;
  final VoidCallback? customSetState;

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoModel> _todoList = [
    TodoModel(
        title: 'Title1',
        content: 'Content1',
        addTime: DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1))),
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
        addTime: DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1))),
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

  TextEditingController _todoController = TextEditingController();
  TextEditingController _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List App'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _todoList.length,
            itemBuilder: (context, index) {
              return listItemCard(_todoList[index]);
            },
          ),
        ),
        //-- Area1 : textFieldWidget + add button
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
      ]),
    );
  }

  Widget listItemCard(TodoModel todoModel) {
    final today = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    final String addTimeText;
    if (todoModel.addTime == null) {
      addTimeText = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 365)));
      // todoModel.addTime = '기한 없음';
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
          TextEditingController _detailController = TextEditingController(text: todoModel.content);
          bool _isCompleted = todoModel.isCompleted;

          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(todoModel.title),
                  content: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: _detailController,
                    // initialValue: todoModel.content, // controller 와 initialValue 는 동시에 사용 못한다.
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
                        print(value.toString());
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
              });
        },
        onLongPress: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => TodoDetailScreen(
                    todoModel: todoModel,
                  )));
        },
        title: Text(
          todoModel.title,
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
              todoModel.content,
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

  void customSetState(String isUpdateDelete, TodoModel todoModel){
    if(isUpdateDelete == 'update'){

    } else {
      _todoList.remove(todoModel);
    }

    setState(() {

    });
  }

  TextStyle customTextStyle(int isPassed, TodoModel todoModel) {
    return TextStyle(
      color: isPassed == 1 ? Colors.red : Colors.black,
      fontWeight: isPassed == 1 ? FontWeight.w600 : FontWeight.w400,
      decoration: todoModel.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
      fontStyle: todoModel.isCompleted ? FontStyle.italic : FontStyle.normal,
    );
  }

}
