// 할 일 추가, 삭제, 완료 체크 (상태 관리)
import 'package:flutter/foundation.dart';
import 'todo_model.dart';

class TodoProvider extends ChangeNotifier { // ChangeNotifier : Flutter에서 제공하는 상태 변경 알림 클래스
  // notifyListeners(); // "변경됐어!" 알림 보내줌.
  final List<TodoModel> _todos = []; // 할 일 목록을 저장하는 변수


  List<TodoModel> get todos => _todos; // 할 일 목록 가져옴.
}
