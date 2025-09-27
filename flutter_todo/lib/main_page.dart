import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'todo_page.dart';

// 메인 페이지는 로고, 텍스트, 버튼만 표시됨 (내용이 고정되어 있음) => StatelessWidget 사용
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEDE6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [          Image.asset(
            'assets/logo(short).png',
            width: 250,
            height: 250,
          ),
          SizedBox(height: 20), // SizedBox : CSS의 margin과 유사
          
          Text(
            '하루하루 해내는 즐거움,\n마이 To-Do',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontFamily: 'OngleipRyuryu',
            ),
          ),
          SizedBox(height: 40),
          
          GestureDetector(
            onTap: () {
              // 투두 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoPage()),
              );
            },
            child: Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFFF9D8C),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink[200]!,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '오늘의 할 일 추가하기',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'OngleipRyuryu',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made by. ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'OngleipRyuryu',
                ),
              ),
              GestureDetector(// GestureDetector : 클릭 이벤트 처리하는 위젯.
                onTap: () async {
                  final url = Uri.parse('https://github.com/xxj15');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Text(
                  '@xxj15',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue[600],
                    fontFamily: 'OngleipRyuryu',
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}