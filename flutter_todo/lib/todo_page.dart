// 투두 페이지

import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
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