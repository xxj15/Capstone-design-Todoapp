// 투두 페이지

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';
import 'todo_model.dart';

// TodoPage : 위젯 자체의 정보를 담음 (설정 등))
class TodoPage extends StatefulWidget {
  @override
  State<TodoPage> createState() => _TodoPageState();
}

// _TodoPageState : 실제 UI를 구성하는 메서드를 포함 (실제 동작과 상태를 관리함)
class _TodoPageState extends State<TodoPage> {
  final TextEditingController _textController = TextEditingController();
  bool _isInputFocused = false; 
  int _checkboxState = 0; // 체크박스 상태: 0=투명, 1=회색, 2=체크
  Map<String, bool> _todoStates = {}; // 각 할 일의 체크 상태를 로컬로 관리
  
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // 오늘 날짜
    final now = DateTime.now();
    final formattedDate = DateFormat('MM/dd EEEE', 'ko_KR').format(now);
    
    return Scaffold(
      backgroundColor: Color(0xFFFFEDE6),
      body: Column(
        children: [
          SizedBox(height: 60),
          
          // 오늘 날짜 표시
          Center(
            child: Text(
              formattedDate,
              style: TextStyle(
                fontSize: 32,
                color: Color(0xFF8B4513),
                fontFamily: 'OngleipRyuryu',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          SizedBox(height: 40),
          
          // 할 일 목록
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // 할 일 입력 필드
                  _buildTodoInputField(),
                  
                  SizedBox(height: 20),
                  
                  // 할 일 목록 표시
                  Expanded(
                    child: Consumer<TodoProvider>(
                      builder: (context, todoProvider, child) {
                        return ListView.builder(
                          itemCount: todoProvider.todos.length,
                          itemBuilder: (context, index) {
                            final todo = todoProvider.todos[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Center(
                                child: _buildTodoItem(todo),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // 할 일 추가 버튼
          Center(
            child: GestureDetector(
              onTap: () {
                final text = _textController.text.trim();
                if (text.isNotEmpty) {
                  // 체크 상태와 함께 할 일 추가
                  final isChecked = _checkboxState == 1;
                  context.read<TodoProvider>().addTodoWithStatus(text, isChecked);
                  _textController.clear();
                  setState(() {
                    _checkboxState = 0; // 체크 상태 초기화
                    _isInputFocused = false;
                  });
                }
              },
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF8B4513),
                  fontFamily: 'OngleipRyuryu',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          SizedBox(height: 40),
        ],
      ),
    );
  }
  
  // 할 일 아이템 위젯 생성
  Widget _buildTodoItem(TodoModel todo) {
    return Container(
      width: 400,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFFF9D8C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // 체크박스
          GestureDetector(
            onTap: () {
              setState(() {
                // 로컬 상태로 간단하게 토글
                _todoStates[todo.id] = !(_todoStates[todo.id] ?? todo.isCompleted);
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey[400]!,
                  width: 2,
                ),
                color: (_todoStates[todo.id] ?? todo.isCompleted) ? Color(0xFF8B4513) : Colors.transparent,
              ),
              child: (_todoStates[todo.id] ?? todo.isCompleted)
                  ? Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          SizedBox(width: 15),
          
          // 할 일 텍스트
          Expanded(
            child: Text(
              todo.text,
              style: TextStyle(
                fontSize: 20,
                color: (_todoStates[todo.id] ?? todo.isCompleted) ? Colors.grey[600] : Colors.black,
                fontFamily: 'OngleipRyuryu',
                decoration: (_todoStates[todo.id] ?? todo.isCompleted) ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          
          // 삭제 버튼
          GestureDetector(
            onTap: () {
              context.read<TodoProvider>().deleteTodo(todo.id);
            },
            child: Text(
              '×',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
  
  // 할 일 입력 필드 위젯 생성
  Widget _buildTodoInputField() {
    return Container(
      width: 400,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20), // CSS의 padding 역할
      decoration: BoxDecoration(
        color: _isInputFocused ? Color(0xFFFF9D8C) : Color(0xFFFFEDE6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // 체크박스 (클릭 가능)
          GestureDetector(
            onTap: () {
              setState(() {
                // 할 일 아이템과 동일하게 토글
                _checkboxState = _checkboxState == 0 ? 1 : 0;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey[400]!,
                  width: 2,
                ),
                color: _checkboxState == 1 ? Color(0xFF8B4513) : Colors.transparent,
              ),
              child: _checkboxState == 1
                  ? Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          SizedBox(width: 15),
          
          // 실제 입력 필드
          Expanded(
            child: TextField(
              controller: _textController,
              onTap: () {
                setState(() {
                  _isInputFocused = true;
                });
              },
              decoration: InputDecoration(
                hintText: '오늘의 할 일을 입력하세요!', // placeholder
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                  fontFamily: 'OngleipRyuryu',
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(
                fontSize: 20,
                color: _checkboxState == 1 ? Colors.grey[600] : Colors.black,
                fontFamily: 'OngleipRyuryu',
                decoration: _checkboxState == 1 ? TextDecoration.lineThrough : null,
              ),
              onSubmitted: (value) { 
              },
            ),
          ),
          // 삭제 버튼
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _checkboxState = 0; // 상태 초기화
                _textController.clear(); // 텍스트 초기화
              });
            },
            child: Text(
              '×',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}