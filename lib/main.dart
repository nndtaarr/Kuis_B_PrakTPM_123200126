import 'package:flutter/material.dart';

import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Praktikum TPM - 123200126',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HalamanListBuku(),
    );
  }
}
