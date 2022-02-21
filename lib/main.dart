import 'package:flutter/material.dart';
import 'package:wisata/screen/homescreen.dart';

void main() {
  runApp(const WisataApp());
}

class WisataApp extends StatelessWidget {
  const WisataApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Banjarmasin',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeScreen(),
    );
  }
}
