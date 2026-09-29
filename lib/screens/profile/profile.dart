import 'package:flutter/material.dart';
import 'package:model_rpg/shared/styled_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle("Character name")),
      body: SingleChildScrollView(child: Column(children: [
            
          ],
        )),
    );
  }
}
