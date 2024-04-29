import 'package:flutter/material.dart';
import '../models/todo_item.dart'; // Import TodoItem
import '../utils/build_todoCards.dart'; // Import buildTodoCards

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoItem> todoList = []; // Define todoList here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TODOALL",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            children: buildTodoCards(todoList), // Use todoList here
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _showAddTodoDialog(context);
            },
            child: const Icon(Icons.add, color: Colors.pinkAccent),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              clearDoneItems();
            },
            child: const Icon(Icons.delete, color: Colors.pinkAccent),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              clearList();
            },
            child: const Icon(Icons.clear_all, color: Colors.pinkAccent),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddTodoDialog(BuildContext context) async {
    String newTodoText = "";

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Todo"),
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              newTodoText = value;
            },
            decoration: const InputDecoration(labelText: "Todo text"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final newTodoItem = TodoItem(checked: false, text: newTodoText);
                addTodoItem(newTodoItem); // Call addTodoItem function
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void addTodoItem(TodoItem todoItem) {
    setState(() {
      todoList.add(todoItem);
    });
  }

  void clearList() {
    setState(() {
      todoList.clear();
    });
  }

  void clearDoneItems() {
    setState(() {
      todoList.removeWhere((todoItem) => todoItem.checked);
    });
  }
}
