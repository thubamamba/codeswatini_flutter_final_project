import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';

class Home1 extends StatelessWidget {
  Home1({Key? key}) : super(key: key);

  // Used to display the ToDo's in the ToDo List in the model
  final todosList = ToDo.todoList();

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
                                fontSize: 35, fontWeight: FontWeight.w600),
                          ),
                        ),
                        // Import ToDoItems
                        // TodoItem(),
                        // Render to do items in a for loop
                        for (ToDo todo in todosList)
                          TodoItem(
                            todo: todo,
                            onDeleteItem: null,
                            onToDoChanged: null,
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
                    // controller: _todoController,
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
                      // _addToDoItem(_todoController.text);
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
}

// You can then separate the appBar into a method
AppBar _mainAppBar() {
  return AppBar(
    // title: const Text('MyToDo App'),
    elevation: 0, // Removes shadow
    backgroundColor: tdBGColor,
    title: Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Aligns the 2 elements
      children: [
        const Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
                'assets/images/avatar.jpg'), // Makes images circular
          ),
        )
      ],
    ),
  );
}
