import 'package:flutter/material.dart';
import 'package:model_rpg/screens/home/home.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SandBox"), backgroundColor: Colors.grey),
      body: Text("SandBox"),
    );
  }
}
