import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/book.dart';

final continueReadingProvider = Provider<List<Book>>((ref) {
  // Mock data for now
  return [
    Book(
      id: '1',
      title: 'A Day of Fallen Night',
      author: 'Samantha Shannon',
      coverUrl: 'assets/covers/fallen_night.jpg',
      rating: 4.5,
      genre: 'Fantasy',
      price: 9.99,
      pages: 432,
      progress: 0.3,
    ),
    // Add more books as needed
  ];
});

final bestSellersProvider = Provider<List<Book>>((ref) {
  // Mock data
  return [
    Book(
      id: '2',
      title: 'Book of Night',
      author: 'Holly Black',
      coverUrl: 'assets/covers/book_night.jpg',
      rating: 4.0,
      genre: 'Fantasy',
      price: 9.99,
      pages: 308,
    ),
    // Add more books
  ];
});
