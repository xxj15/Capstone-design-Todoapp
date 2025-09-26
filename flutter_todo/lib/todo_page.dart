// 투두 페이지

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// TodoPage : 위젯 자체의 정보를 담음 (설정 등))
class TodoPage extends StatefulWidget {
  @override
  State<TodoPage> createState() => _TodoPageState();
}

// _TodoPageState : 실제 UI를 구성하는 메서드를 포함. 실제 동작과 상태를 관리함.
class _TodoPageState extends State<TodoPage> {
  final TextEditingController _textController = TextEditingController();
  bool _isInputFocused = false; // 입력 필드 포커스 상태 
  
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
                  
                  // 할 일 입력 필드 (임시로 항상 표시)
                  _buildTodoInputField(),
                ],
              ),
            ),
          ),
          
          // 할 일 추가 버튼
          Center(
            child: GestureDetector(
              onTap: () {
                print('+ 버튼 클릭');
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
  Widget _buildTodoItem(String text, bool isCompleted) {
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
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF8B4513),
                width: 2,
              ),
              color: isCompleted ? Color(0xFF8B4513) : Colors.transparent,
            ),
            child: isCompleted
                ? Icon(
                    Icons.check,
                    size: 12,
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(width: 15),
          
          // 할 일 텍스트
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: isCompleted ? Colors.grey[600] : Colors.black,
                fontFamily: 'OngleipRyuryu',
                decoration: isCompleted ? TextDecoration.lineThrough : null,
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
          // 체크박스 (비활성화)
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey[400]!,
                width: 2,
              ),
              color: Colors.transparent,
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
                color: Colors.black,
                fontFamily: 'OngleipRyuryu',
              ),
              onSubmitted: (value) { // 엔터키 입력시 실행

              },
            ),
          ),
        ],
      ),
    );
  }
}