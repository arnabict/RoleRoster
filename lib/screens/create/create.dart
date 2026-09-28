import 'package:flutter/material.dart';
import 'package:model_rpg/models/vocation.dart';
import 'package:model_rpg/screens/create/vocation_card.dart';
import 'package:model_rpg/shared/styled_button.dart';
import 'package:model_rpg/shared/styled_text.dart';
import 'package:model_rpg/theme.dart';
import "package:google_fonts/google_fonts.dart";

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

    void handleSubmit() {
      if (_nameController.text.trim().isEmpty) {
        print("name must not be empty");
        return;
      }
      if (_sloganController.text.trim().isEmpty) {
        print("slogan must not be empty");
        return;
      }
      print(_nameController.text);
      print(_sloganController.text);
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
                  child: StyledText(
                    "Create a name & slogan for your character.",
                  ),
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
}
