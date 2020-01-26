import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_last_project/todo.dart';
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}
class _TodoListState extends State<TodoList> {
  List<Todo> todos = [];
  TextEditingController controller = new TextEditingController();
    _todoListToggle(Todo todo, bool isChecked) {
        setState(() {
      todo.isDone = isChecked;
    });
   }
    Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      title: Text(todo.title),
      value: todo.isDone,
      onChanged: (bool isChecked) {
      _todoListToggle(todo, isChecked);
      },
     );
   }
_addData() async {
final todo = await showDialog<Todo>(
       context: context,
       builder: (BuildContext context) {
        return AlertDialog(
           title: Text('New todo'),
           content: TextField(
           controller: controller,
           autofocus: true,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
               onPressed: () {
               Navigator.of(context).pop(); 
                 controller.clear();
              },    
            ),
            FlatButton(
              child: Text("Add"),
              onPressed: () {
              setState(() {
              final todo = new Todo(title: controller.value.text);
              if(controller.value.text==""){
                print("");
              }else{
                todos.add(todo);
              }
                controller.clear();
                  todo.add(todo);
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
       },
      
     );
   } 
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: _addData,
       ),
    );
  }
}