import 'package:flutter/material.dart';

class BookCoverSection extends StatelessWidget {
  const BookCoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Book Cover
          Container(
            height: 280,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/covers/one_dark_window.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Rating and Pages
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Rating
              Row(
                children: const [
                  Icon(Icons.star, color: Color(0xFFFFD700), size: 20),
                  SizedBox(width: 4),
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Category
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Fantasy',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Pages
              Text(
                '432 Pages',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
