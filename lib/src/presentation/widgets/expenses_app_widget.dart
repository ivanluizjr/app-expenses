import 'package:expences/src/presentation/widgets/my_home_page_widget.dart';
import 'package:flutter/material.dart';

class ExpansesApp extends StatelessWidget {
  const ExpansesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
