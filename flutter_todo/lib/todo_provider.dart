// 할 일 추가, 삭제, 완료 체크 (상태 관리)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]); // 초기 상태는 빈 리스트

  List<TodoModel> get todos => state; // 할 일 목록 가져옴.

  // 기능 1 - 할 일 추가 
  void addTodo(String text) {
    if (text.trim().isNotEmpty) {
      final todo = TodoModel(
        id: state.length.toString(), 
        text: text.trim(),
        isCompleted: false,
      );
      state = [...state, todo]; // 새로운 리스트로 상태 업데이트
    }
  }

  // 기능 1-2 - 할일 추가 (with 체크 상태)
  void addTodoWithStatus(String text, bool isCompleted) {
    if (text.trim().isNotEmpty) {
      final todo = TodoModel(
        id: state.length.toString(), 
        text: text.trim(),
        isCompleted: isCompleted,
      );
      state = [...state, todo]; // 새로운 리스트로 상태 업데이트
    }
  }

  // 기능 2 - 할 일 삭제
  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  // 기능 3 - 할 일 완료 상태 토글
  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return TodoModel(
          id: todo.id,
          text: todo.text,
          isCompleted: !todo.isCompleted,
        );
      }
      return todo;
    }).toList();
  }
}

// Provider 정의
final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});
