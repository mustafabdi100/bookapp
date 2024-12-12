import 'package:flutter/material.dart';
import 'best_seller_card.dart';

class BestSellersSection extends StatelessWidget {
  const BestSellersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Best Sellers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              BestSellerCard(
                title: 'Book of Night',
                author: 'Holly Black',
                coverUrl: 'assets/covers/book_night.jpg',
                rating: 4.0,
                price: 9.99,
              ),
              BestSellerCard(
                title: 'The Wolf Den',
                author: 'Elodie Harper',
                coverUrl: 'assets/covers/wolf_den.jpg',
                rating: 4.8,
                price: 6.99,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
