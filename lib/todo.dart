import 'package:flutter/material.dart';
import 'package:journive_app/home.dart';
import 'package:journive_app/menu.dart';

class Todo extends StatefulWidget {
  Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _Todo();
}

class _Todo extends State<Todo> {
  final todosList = CreateTodo.todoList();
  List<CreateTodo> _foundCreateTodo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundCreateTodo = todosList;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffB8E8FC),
      appBar: AppBar(
        backgroundColor: Color(0xffC8FFD4),
        automaticallyImplyLeading: false,
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset('images/journivelogo.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Menu();
              }));
            },
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                    child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        'My Todos',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // for (CreateTodo todoo in _foundCreateTodo.reversed)
                    //   CreateTodoItem(
                    //     todo: todoo,
                    //     onCreateTodoChanged: _handleCreateTodoChange,
                    //     onDeleteItem: _deleteCreateTodoItem,
                    //   ),
                  ],
                ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
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
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: 'Add To-Do', border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 48,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffB1AFFF),
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

//valid 1
// void _handleCreateTodoChange(CreateTodo todo) {
//   setState(() {
//     todo.isDone = !todo.isDone;
//   });
// }

// void _runFilter(String enteredKeyword) {
//   List<CreateTodo> results = [];
//   if (enteredKeyword.isEmpty) {
//     results = todosList;
//   } else {
//     results = todosList
//         .where((item) =>
//             item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase()))
//         .toList();
//   }

//   setState(() {
//     _foundCreateTodo = results;
//   });
// }

// void _runFilter(String enteredKeyword) {
//   List<CreateTodo> results = [];
//   if (enteredKeyword.isEmpty) {
//     results = todosList;
//   } else {
//     results = todosList
//     .where((item) => item.todoText!
//     .toLowerCase()
//     .contains(enteredKeyword.toLowerCase()))
//   }
// }

Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    // child: TextField(
    //   onChanged: (value) => _runFilter(value),
    //   decoration: InputDecoration(
    //     contentPadding: EdgeInsets.all(0),
    //     prefixIcon: Icon(
    //       Icons.search,
    //       color: Colors.black,
    //       size: 20,
    //     ),
    //     prefixIconConstraints: BoxConstraints(
    //       maxHeight: 20,
    //       minWidth: 25,
    //     ),
    //     border: InputBorder.none,
    //     hintText: 'Search',
    //     hintStyle: TextStyle(color: Colors.grey),
    //   ),
    // ),
  );
}

//CREATE TODO
class CreateTodo {
  String? id;
  String? todoText;
  bool isDone;

  CreateTodo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<CreateTodo> todoList() {
    return [
      CreateTodo(id: '01', todoText: 'Workout', isDone: true),
    ];
  }
}

//TODO ITEM
class CreateTodoItem extends StatelessWidget {
  final CreateTodo todo;
  final onCreateTodoChanged;
  final onDeleteItem;

  const CreateTodoItem({
    Key? key,
    required this.todo,
    required this.onCreateTodoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onCreateTodoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {
                onDeleteItem(todo.id);
              },
              icon: Icon(Icons.delete),
              color: Colors.white,
              iconSize: 16,
            ),
          ),
        ));
  }
}
// class CreateTodo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Color(0xffB8E8FC),
//       appBar: AppBar(
//         leading: Container(
//           padding: EdgeInsets.all(5),
//           child: Image.asset('images/journivelogo.png'),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 // Navigator.pushReplacement(context,
//                 //     MaterialPageRoute(builder: (context) {
//                 //   return Todo();
//                 // }));
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ))
//         ],
//         automaticallyImplyLeading: false,
//         backgroundColor: Color(0xffC8FFD4),
//         centerTitle: true,
//         title: Text('My To-Do'),
//         // leading: IconButton(
//         //   onPressed: () {
//         //     Navigator.pushReplacement(context,
//         //         MaterialPageRoute(builder: (context) {
//         //       return Todo();
//         //     }));
//         //   },
//         //   icon: Icon(
//         //     Icons.arrow_back,
//         //     color: Colors.black,
//         //   ),
//         // ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 8,
//           ),
//           Center(
//             child: Container(width: 328, height: 400, color: Color(0xffC8FFD4)),
//           )
//         ],
//       ),
//     );
//   }
// }
