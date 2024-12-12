import 'package:flutter/material.dart';

class SynopsisSection extends StatelessWidget {
  const SynopsisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Synopsis',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Elspeth needs a monster. The monster might be her. Elspeth "
          "Spindle needs more than luck to stay safe in the eerie, mist-"
          "locked kingdom of Blunder—she needs a monster. She calls "
          "him the Nightmare, an ancient, mercurial spirit trapped in her "
          "head. He protects her. He keeps her secrets.\n\n"
          "But nothing comes for free, especially magic. When Elspeth "
          "meets a mysterious highwayman on the forest road, her life "
          "takes a drastic turn. Thrust into a world of shadow and "
          "deception, she joins a dangerous quest to cure Blunder from "
          "the dark magic infecting it. And the highwayman? He just so "
          "happens to be the King's nephew, Captain of the most "
          "dangerous men in Blunder—and guilty of high treason.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
