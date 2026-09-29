import 'package:flutter/material.dart';
import 'package:model_rpg/models/character.dart';
import 'package:model_rpg/models/vocation.dart';
import 'package:model_rpg/screens/create/vocation_card.dart';
import 'package:model_rpg/shared/styled_button.dart';
import 'package:model_rpg/shared/styled_text.dart';
import 'package:model_rpg/theme.dart';
import "package:google_fonts/google_fonts.dart";
import "package:uuid/uuid.dart";

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      return;
    }
    characters.add(
      Character(
        vocation: selectedVocation,
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        id: uuid.v4(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle("Character Creation"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: StyledHeading("Welcome, new player.")),
              Center(
                child: StyledText("Create a name & slogan for your character."),
              ),

              SizedBox(height: 30),

              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText("Character name"),
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Character slogan"),
                ),
              ),

              SizedBox(height: 30),

              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: StyledHeading("Choose a vocation.")),
              Center(
                child: StyledText("This determines your available skills."),
              ),

              SizedBox(height: 30),

              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),

              SizedBox(height: 30),

              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: StyledHeading("Good Luck.")),
              Center(child: StyledText("And enjoy the journey...")),

              SizedBox(height: 30),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledHeading("Create Character"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
