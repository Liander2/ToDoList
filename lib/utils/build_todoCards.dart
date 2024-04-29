import 'package:flutter/material.dart';
import '../models/todo_item.dart';
import '../widgets/todo_card.dart';

List<Widget> buildTodoCards(List<TodoItem> todoList) {
  List<Widget> todoCards = [];
  for (var todoItem in todoList) {
    final todoCard = TodoCard(
      todoItem: todoItem,
    );

    todoCards.add(todoCard);
  }

  return todoCards;
}
