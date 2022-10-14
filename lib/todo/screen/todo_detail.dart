import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:songdo_study/todo/model/todoModel.dart';
// import 'package:songdo_study/todo/screen/todo_screen.dart';

class TodoDetailScreen extends StatefulWidget {
  final TodoModel todoModel;

  // final arguments;

  const TodoDetailScreen({Key? key, required this.todoModel}) : super(key: key);

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController =
        TextEditingController(text: widget.todoModel.content);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todoModel.title!),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
                onTap: () {
                  // 삭제 flag
                  widget.todoModel.stateCheck = 'delete';
                  Navigator.pop(context, widget.todoModel);
                },
                child: Icon(Icons.delete)),
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
                    onPressed: () {
                      // 아직 선택된 데이터가 아니므로 future 를 쓴다?
                      Future<DateTime?> selectedDate = showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(data: ThemeData.dark(), child: child!);
                          });

                      selectedDate.then((dateTime) {
                        setState(() {
                          widget.todoModel.addTime =
                              DateFormat('yyyy-MM-dd').format(dateTime!);
                        });
                      });
                    },
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
          setState(() {
            // update
            widget.todoModel.content = _textController.text;
          });

          Navigator.pop(context, widget.todoModel);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
