// lib/features/reader/providers/bookmark_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Bookmark {
  final String bookId;
  final String chapterId;
  final int pageNumber;
  final String note;
  final DateTime createdAt;

  const Bookmark({
    required this.bookId,
    required this.chapterId,
    required this.pageNumber,
    this.note = '',
    required this.createdAt,
  });
}

class BookmarksNotifier extends StateNotifier<List<Bookmark>> {
  BookmarksNotifier() : super([]);

  void addBookmark(Bookmark bookmark) {
    state = [...state, bookmark];
  }

  void removeBookmark(String bookId, String chapterId, int pageNumber) {
    state = state
        .where((bookmark) =>
            bookmark.bookId != bookId ||
            bookmark.chapterId != chapterId ||
            bookmark.pageNumber != pageNumber)
        .toList();
  }

  bool isBookmarked(String bookId, String chapterId, int pageNumber) {
    return state.any((bookmark) =>
        bookmark.bookId == bookId &&
        bookmark.chapterId == chapterId &&
        bookmark.pageNumber == pageNumber);
  }
}

final bookmarksProvider =
    StateNotifierProvider<BookmarksNotifier, List<Bookmark>>((ref) {
  return BookmarksNotifier();
});
