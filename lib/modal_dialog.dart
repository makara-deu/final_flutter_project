import 'package:flutter/material.dart';
import 'package:flutter_project/todo.dart';
class ModalDialog extends StatefulWidget {
  @override
  _ModalDialogState createState() => _ModalDialogState();
}

class _ModalDialogState extends State<ModalDialog> {
  List<Todo> todos = [];

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }
  Widget _buil(BuildContext context, int index){
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked){
        _toggleTodo(todo, isChecked);
      },
    );
  }
    final controller = new TextEditingController();
     createModal(BuildContext context){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("New List"),
          content: TextField(
            autofocus: true,
            controller: controller,
          ),
          actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            setState(() {
             final todo = new Todo(title: controller.value.text);
            //  debugPrint(controller.value.text.toString());
             if(controller.value.text == ""){
               print("");
             }else{
               todos.add(todo);
             }
              controller.clear();
              Navigator.of(context).pop(todo); 
            });
          },
        ),
      ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0)
            )
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
  
      return Scaffold(
      appBar: AppBar(
        title: Text('Todo  List'),
      ),
      body: ListView.builder(
        itemBuilder: _buil,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => createModal(context),
        child: Icon(Icons.add),

      ),
    );
    
  }
}