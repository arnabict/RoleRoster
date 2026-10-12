import 'package:flutter/material.dart';
import 'package:model_rpg/models/character.dart';
import 'package:model_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

  List<Character> get characters => _characters;

  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  void fetchCharacterOnce() async {
    if (characters.isEmpty) {
      final snapshot = await FirestoreService.getCharacterOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }

  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }
}
