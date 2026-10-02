import 'package:flutter/material.dart';
import 'package:model_rpg/models/character.dart';
import 'package:model_rpg/screens/profile/skill_list.dart';
import 'package:model_rpg/screens/profile/stats_table.dart';
import 'package:model_rpg/shared/styled_text.dart';
import 'package:model_rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/vocations/${character.vocation.image}",
                    width: 140,
                    height: 140,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: AppColors.secondaryColor.withValues(alpha: 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading("Slogan"),
                    StyledText(character.slogan),
                    SizedBox(height: 10),
                    StyledHeading("Weapon of Choice"),
                    StyledText(character.weapon),
                    SizedBox(height: 10),
                    StyledHeading("Unique  Ability"),
                    StyledText(character.ability),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
