import 'package:flutter/material.dart';
import 'package:model_rpg/screens/create/create.dart';
import 'package:model_rpg/screens/home/home.dart';
import 'package:model_rpg/theme.dart';

void main() {
  runApp(MaterialApp(theme: primaryTheme, home: Create()));
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
