import 'package:model_rpg/models/skill.dart';
import 'package:model_rpg/models/stats.dart';
import 'package:model_rpg/models/vocation.dart';

class Character with Stats {
  Character({
    required this.vocation,
    required this.name,
    required this.slogan,
    required this.id,
  });

  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

// dummy data

List<Character> characters = [
  Character(
    vocation: Vocation.wizard,
    name: "Klara",
    slogan: "Razer Sharp!",
    id: "1",
  ),
  Character(
    vocation: Vocation.junkie,
    name: "Jonny",
    slogan: "Wind Blaze!",
    id: "2",
  ),
  Character(
    vocation: Vocation.raider,
    name: "Maya",
    slogan: "Rivoroid!",
    id: "3",
  ),
  Character(
    vocation: Vocation.ninja,
    name: "Alan",
    slogan: "Exempria!",
    id: "4",
  ),
];
