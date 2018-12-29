import 'package:flutter/material.dart';
import 'package:stock_insight/widgets/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'StockInsight',
      theme: new ThemeData(
        primaryColor: Colors.grey[850],
      ),
      home: new Login(),
    );
  }
}
