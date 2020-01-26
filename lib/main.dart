
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TodoList.dart';

void main()=>runApp(Todos());
class Todos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoList(),
    );
  }
}