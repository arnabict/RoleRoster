import 'package:flutter/material.dart';
import 'package:model_rpg/models/character.dart';
import 'package:model_rpg/models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    Character(
      vocation: Vocation.wizard,
      name: "Klara",
      slogan: "Razer Sharp!",
      id: "1",
      // weapon: "Sword",
      // ability: "Tornado",
    ),
    Character(
      vocation: Vocation.junkie,
      name: "Jonny",
      slogan: "Wind Blaze!",
      id: "2",
      // weapon: "Sword",
      // ability: "Tornado",
    ),
    Character(
      vocation: Vocation.raider,
      name: "Maya",
      slogan: "Rivoroid!",
      id: "3",
      // weapon: "Sword",
      // ability: "Tornado",
    ),
    Character(
      vocation: Vocation.ninja,
      name: "Alan",
      slogan: "Exempria!",
      id: "4",
      // weapon: "Sword",
      // ability: "Tornado",
    ),
  ];

  List<Character> get characters => _characters;

  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }
}
