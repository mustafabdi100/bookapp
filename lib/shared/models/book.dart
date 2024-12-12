class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final double rating;
  final String genre;
  final double price;
  final int pages;
  final String synopsis;
  final double progress;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.rating,
    required this.genre,
    required this.price,
    required this.pages,
    this.synopsis = '',
    this.progress = 0,
  });
}
