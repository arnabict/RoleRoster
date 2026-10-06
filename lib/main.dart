import 'package:flutter/material.dart';
import 'package:model_rpg/screens/home/home.dart';
import 'package:model_rpg/services/character_store.dart';
import 'package:model_rpg/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterStore(),
      child: MaterialApp(theme: primaryTheme, home: Home()),
    ),
  );
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
