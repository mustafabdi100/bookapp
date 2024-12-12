import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_filters.dart';
import '../widgets/continue_reading_section.dart';
import '../widgets/best_sellers_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: const Row(
                children: [
                  Text(
                    'Book',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Junction',
                    style: TextStyle(
                      color: Color(0xFFE91E63),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  BookSearchBar(),
                  SizedBox(height: 16),
                  CategoryFilters(),
                  SizedBox(height: 24),
                  ContinueReadingSection(),
                  SizedBox(height: 24), // Add this
                  BestSellersSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
