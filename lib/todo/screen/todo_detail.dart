import 'package:flutter/material.dart';
import 'package:songdo_study/todo/model/todoModel.dart';
import 'package:songdo_study/todo/screen/todo_screen.dart';

class TodoDetailScreen extends StatefulWidget {
  final TodoModel todoModel;

  const TodoDetailScreen({Key? key, required this.todoModel}) : super(key: key);

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController(text: widget.todoModel.content);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todoModel.title),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'None',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                '완료 여부',
                style: TextStyle(fontSize: 16),
              ),
              value: widget.todoModel.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  widget.todoModel.isCompleted = value!;
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '마감 기한',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  widget.todoModel.addTime ?? "기한 없음",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '마감 기한 설정',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {



          // page move
          setState(() {
            // update
            widget.todoModel.content = _textController.text;

          });

          Navigator.of(context).push(MaterialPageRoute(builder: (_) => TodoScreen(



          )));

        },
        child: Icon(Icons.save),
      ),
    );
  }
}
