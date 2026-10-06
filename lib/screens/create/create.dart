import 'package:flutter/material.dart';
import 'package:model_rpg/models/character.dart';
import 'package:model_rpg/models/vocation.dart';
import 'package:model_rpg/screens/create/vocation_card.dart';
import 'package:model_rpg/screens/home/home.dart';
import 'package:model_rpg/services/character_store.dart';
import 'package:model_rpg/shared/styled_button.dart';
import 'package:model_rpg/shared/styled_text.dart';
import 'package:model_rpg/theme.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:provider/provider.dart';
import "package:uuid/uuid.dart";

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
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
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: StyledHeading("Missing Character Name"),
            content: StyledText(
              "Every good RPG character needs a great name...",
            ),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: StyledHeading("Close"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: StyledHeading("Missing Slogan Name"),
            content: StyledText("Remember to add a catchy slogan..."),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: StyledHeading("Close"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }

    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        vocation: selectedVocation,
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        id: uuid.v4(),
        weapon: "Sword",
        ability: "Tornado",
      ),
    );

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => Home()));
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
