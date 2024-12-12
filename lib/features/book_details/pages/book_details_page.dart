// lib/features/book_details/pages/book_details_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_junction/features/reader/pages/reader_page.dart';

class BookDetailsPage extends ConsumerWidget {
  final String bookId;

  const BookDetailsPage({
    super.key,
    required this.bookId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey[100]!,
                    Colors.grey[50]!,
                    Colors.white,
                  ],
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  floating: true,
                ),
                // Book Content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Book Cover Image
                        Container(
                          height: 280,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/covers/one_dark_window.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Title
                        const Text(
                          'One Dark Window',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        // Author
                        Text(
                          'Rachel Gillig',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Stats Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Rating
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFD700),
                                  size: 20,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 24),
                            // Category
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Fantasy',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            // Pages
                            Text(
                              '432 Pages',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Synopsis
                        const Text(
                          'Synopsis',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 16),
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
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Action Buttons
                        Row(
                          children: [
                            // Preview/Read Button
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReaderPage(
                                        bookId: bookId,
                                        chapterTitle: 'Chapter One',
                                      ),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text('Preview'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Buy Now Button
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: Implement purchase functionality
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4A4A4A),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
