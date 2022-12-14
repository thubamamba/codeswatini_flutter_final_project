import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Used to display the ToDo's in the ToDo List in the model
  final todosList = ToDo.todoList();
  // Final for adding Todo
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor, //Background for home screen
      appBar: _mainAppBar(),
      // Wrap in a Stack to have the bottom elements
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 25),
                          child: const Text(
                            "All My ToDo's",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // Import ToDoItems
                        // TodoItem(),
                        // Render to do items in a for loop
                        for (ToDo todooo in todosList)
                          TodoItem(
                            todo: todooo,
                            // Add this when you have added functionality
                            onToDoChanged: _handleToDoChange,
                            // onDeleteItem: null // First have this as null b4 adding deletion functionality
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ),
                  )
                ],
              )),
          // For the bottom stuff
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    // for adding new ToDo
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      print("Add new item");
                      // Adds functionality
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Function to handle todo change
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone; // Sets it to false
    });
  }

  // Handles deletion of todo
  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  // Adds new todo
  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        // use timestamp for ID so it is unique
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoDescription: toDo
      ));
    });
    // Clears the text field after adding a ToDo
    _todoController.clear();
  }
}

// You can then separate the appBar into a method
AppBar _mainAppBar() {
  return AppBar(
    title: const Text('MyToDo App'),
    centerTitle: true,
    elevation: 0, // Removes shadow
    backgroundColor: tdBlue,
  );
}

