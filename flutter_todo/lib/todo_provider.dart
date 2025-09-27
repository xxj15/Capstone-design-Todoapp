// 할 일 추가, 삭제, 완료 체크 (상태 관리)
import 'package:flutter/foundation.dart';
import 'todo_model.dart';

class TodoProvider extends ChangeNotifier { // ChangeNotifier : Flutter에서 제공하는 상태 변경 알림 클래스
  // notifyListeners(); // "변경됐어!" 알림 보내줌.
  final List<TodoModel> _todos = []; // 할 일 목록을 저장하는 변수


  List<TodoModel> get todos => _todos; // 할 일 목록 가져옴.

  // 기능 1 - 할 일 추가 
  void addTodo(String text) {
    if (text.trim().isNotEmpty) {
      final todo = TodoModel(
        id: _todos.length.toString(), 
        text: text.trim(),
        isCompleted: false,
      );
      _todos.add(todo);
      notifyListeners(); 
    }
  }

  // 기능 2 - 할 일 삭제
  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  // 기능 3 - 할 일 완료 상태 토글
  void toggleTodo(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex != -1) {
      final currentTodo = _todos[todoIndex];
      _todos[todoIndex] = TodoModel(
        id: currentTodo.id,
        text: currentTodo.text,
        isCompleted: !currentTodo.isCompleted,
      );
      notifyListeners();
    }
  }
}
