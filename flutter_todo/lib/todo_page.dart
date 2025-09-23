// 투두 페이지

import 'package:flutter/material.dart';

// TodoPage : 위젯 자체의 정보를 담음 (설정 등))
class TodoPage extends StatefulWidget {
  @override
  State<TodoPage> createState() => _TodoPageState();
}

// _TodoPageState : 실제 UI를 구성하는 메서드를 포함. 실제 동작과 상태를 관리함.
class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEDE6),
      body: Center(
        child: Text(
          '투두페이지입니다',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: 'OngleipRyuryu',
          ),
        ),
      ),
    );
  }
}