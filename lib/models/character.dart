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
