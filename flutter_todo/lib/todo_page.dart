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
  @override
  Widget build(BuildContext context) {
    // 오늘 날짜를 한국어 형식으로 포맷팅
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
          
  
        ],
      ),
    );
  }
}