import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model_rpg/models/skill.dart';
import 'package:model_rpg/models/stats.dart';
import 'package:model_rpg/models/vocation.dart';

class Character with Stats {
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
    // required this.weapon,
    // required this.ability,
  });

  final Set<Skill> skills = {};
  final String name;
  final String slogan;
  final Vocation vocation;
  final String id;
  // final String weapon;
  // final String ability;
  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "slogan": slogan,
      "isFav": _isFav,
      "vocation": vocation.toString(),
      "skills": skills.map((s) => s.id).toList(),
      "stats": statsAsMap,
      "points": points,
    };
  }

  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    Character character = Character(
      name: data["name"],
      slogan: data["slogan"],
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data["vocation"],
      ),
      id: snapshot.id,
    );

    for (String id in data["skills"]) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkill(skill);
    }

    if (data["isFav"] == true) {
      character.toggleIsFav();
    }

    character.setStats(points: data["points"], stats: data["stats"]);

    return character;
  }
}

// dummy data

List<Character> characters = [
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
