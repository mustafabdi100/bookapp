import 'package:flutter/material.dart';
import 'continue_reading_card.dart';

class ContinueReadingSection extends StatelessWidget {
  const ContinueReadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Continue Reading',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              ContinueReadingCard(
                title: 'A Day of Fallen Night',
                author: 'Samantha Shannon',
                coverUrl:
                    'assets/covers/fallen_night.png', // We'll add this later
                progress: 0.3,
              ),
              ContinueReadingCard(
                title: 'Ninth House',
                author: 'Leigh Bardugo',
                coverUrl:
                    'assets/covers/ninth_house.png', // We'll add this later
                progress: 0.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
