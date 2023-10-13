import 'package:flutter/material.dart';
import 'ases/input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FORM PRODUCT",
      home: FormInput(),
    );
  }
}
