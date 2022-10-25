import 'package:flutter/material.dart';
import 'package:journive_app/home.dart';
import 'package:journive_app/menu.dart';

// class Todo extends StatefulWidget {
//   _Todo createState() => _Todo();
// }

// class _Todo extends State<Todo> {
//   final todosList = ToDo.todoList();
//   List<ToDo> _foundToDo = [];
//   final _todoController = TextEditingController();

//   void initState() {
//     _foundToDo = todosList;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Color(0xffB8E8FC),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: Container(
//           padding: EdgeInsets.all(5),
//           child: Image.asset('images/journivelogo.png'),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.home,
//               color: Colors.black,
//             ),
//           )
//         ],
//         backgroundColor: Color(0xffC8FFD4),
//       ),
//     );
//   }

// @override
// Widget build(BuildContext context) {
//   // TODO: implement build
//   return Scaffold(
//     backgroundColor: Color(0xffB8E8FC),
//     appBar: AppBar(
//       automaticallyImplyLeading: false,
//       leading: Container(
//         padding: EdgeInsets.all(5),
//         child: Image.asset('images/journivelogo.png'),
//       ),
//       actions: [
//         IconButton(
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) {
//                 return Menu();
//               }));
//             },
//             icon: Icon(
//               Icons.home,
//               color: Colors.black,
//             ))
//       ],
//       backgroundColor: Color(0xffC8FFD4),
//       centerTitle: true,
//       title: Text(
//         'My To-Do',
//         style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
//       ),
//     ),
//     body: Column(
//       children: [
//         SizedBox(
//           height: 8,
//         ),
//         Text(
//           'TO-DO LIST',
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
//         ),
//         SizedBox(
//           height: 480,
//         ),
//         ElevatedButton(
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) {
//                 return CreateTodo();
//               }));
//             },
//             style: ElevatedButton.styleFrom(primary: Color(0xffB1AFFF)),
//             child: Text(
//               "Add To-Do",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ))
//       ],
//     ),
//   );
// }
// }

class CreateTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffB8E8FC),
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset('images/journivelogo.png'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) {
                //   return Todo();
                // }));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffC8FFD4),
        centerTitle: true,
        title: Text('My To-Do'),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(context,
        //         MaterialPageRoute(builder: (context) {
        //       return Todo();
        //     }));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Center(
            child: Container(width: 328, height: 400, color: Color(0xffC8FFD4)),
          )
        ],
      ),
    );
  }
}
