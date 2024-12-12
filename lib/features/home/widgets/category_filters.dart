import 'package:flutter/material.dart';

class CategoryFilters extends StatefulWidget {
  const CategoryFilters({super.key});

  @override
  State<CategoryFilters> createState() => _CategoryFiltersState();
}

class _CategoryFiltersState extends State<CategoryFilters> {
  String selectedCategory = 'Fantasy'; // Default selected category

  final List<String> categories = [
    'All',
    'Romance',
    'Sci-Fi',
    'Fantasy',
    'Classics',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  selectedCategory = category;
                });
              },
              backgroundColor: Colors.white,
              selectedColor: const Color(0xFF4A4A4A),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? Colors.transparent : Colors.grey[300]!,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
