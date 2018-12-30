import 'package:flutter/material.dart';
import 'package:stock_insight/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockInsight',
      theme: ThemeData(
        primaryColor: Colors.grey[850],
      ),
      home: Login(),
    );
  }
}
