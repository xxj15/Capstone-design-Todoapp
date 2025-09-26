
class TodoModel {
  final String id; // 할 일의 고유 식별자(id)
  final String text; // 할 일 내용
  final bool isCompleted; // 완료 여부

// todo_page.dart에서 이제 List<String> _todos 대신 List<TodoModel> _todos 를 사용할 수 있다.
  TodoModel({
    required this.id,
    required this.text,
    required this.isCompleted,
  });
}