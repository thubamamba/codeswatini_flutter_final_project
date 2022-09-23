import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';

class TodoItem extends StatelessWidget {
  // We expect a todo in a TodoItem
  final ToDo todo;  // Variable called ToDo which will be todo type
  // Connects functionality - add this at the end
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(child: Text('ToDo Item'),);
    return Container(
      margin: EdgeInsets.only(bottom: 20),  // Add this last
      child: ListTile(
        // When clicking on todo
        onTap: () {
          print('Clicked on ToDo Item');
          //  Add functionality
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          // Used dynamically
          // Icons.check_box,
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          // 'Check',
          todo.todoDescription!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            // decoration: TextDecoration.lineThrough,   // This will be used dynamically
            decoration: todo.isDone? TextDecoration.lineThrough : null // This will be used dynamically

          )
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              print("Delete ToDo");
              // Adds functionality
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
