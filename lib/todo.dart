import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journive_app/menu.dart';
import 'package:journive_app/models/todo_item.dart';

class MyTodo extends StatefulWidget {
  MyTodo({Key? key}) : super(key: key);

  @override
  State<MyTodo> createState() => _MyTodo();
}

class _MyTodo extends State<MyTodo> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB1AFFF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My To-Do',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black),
        ),
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
              ))
        ],
        backgroundColor: Color(0xffC8FFD4),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 48,
                          bottom: 16,
                        ),
                        child: Text(
                          "Today's To-Do List",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        TodoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
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
                      horizontal: 24,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff93C6DB),
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
                          hintText: 'Add New To-Do',
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 16,
                    right: 16,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff669AAF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),
                      minimumSize: Size(56, 56),
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

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xff669AAF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 24,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 16, maxWidth: 24),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
