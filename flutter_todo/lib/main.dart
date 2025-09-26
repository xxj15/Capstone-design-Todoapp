import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // 로케일 데이터  초기화 를 위해 필요
import 'main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyToDo',
      home: MainPage(),
    );
  }
}
