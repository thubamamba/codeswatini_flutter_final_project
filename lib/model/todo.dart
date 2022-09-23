// Model is the data flow - is the M in MVC (Model View Controller) Architecture
class ToDo {
  String? id;
  String? todoDescription;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoDescription,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoDescription: 'Read 5AM club', isDone: true ),
      ToDo(id: '02', todoDescription: 'Go for a jog', isDone: true ),
      ToDo(id: '03', todoDescription: 'Code for 2 hours', ),
      ToDo(id: '04', todoDescription: 'Study for test', ),
      ToDo(id: '05', todoDescription: 'Go for coffee date', ),
      ToDo(id: '06', todoDescription: 'Watch Game of Thrones', ),
    ];
  }
}