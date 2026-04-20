import 'package:bai09/bai3.dart';
import 'package:bai09/bai4_1.dart';
import 'package:bai09/bai5.dart';
import 'package:bai09/bai6.dart';
import 'package:flutter/material.dart';
import 'bai1.dart';
import 'package:bai09/bai2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
      ),

      home: UserListScreen(),
    );
  }
}