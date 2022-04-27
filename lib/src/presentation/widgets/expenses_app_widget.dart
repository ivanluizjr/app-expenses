import 'package:expences/src/presentation/views/my_home_page.dart';
import 'package:flutter/material.dart';

class ExpansesApp extends StatelessWidget {
  const ExpansesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
