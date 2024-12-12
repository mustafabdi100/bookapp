// lib/features/reader/providers/highlight_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextHighlight {
  final String bookId;
  final String chapterId;
  final int pageNumber;
  final String text;
  final Color color;
  final String? note;
  final DateTime createdAt;

  const TextHighlight({
    required this.bookId,
    required this.chapterId,
    required this.pageNumber,
    required this.text,
    required this.color,
    this.note,
    required this.createdAt,
  });
}

class HighlightsNotifier extends StateNotifier<List<TextHighlight>> {
  HighlightsNotifier() : super([]);

  void addHighlight(TextHighlight highlight) {
    state = [...state, highlight];
  }

  void removeHighlight(String bookId, String chapterId, String text) {
    state = state
        .where((highlight) =>
            highlight.bookId != bookId ||
            highlight.chapterId != chapterId ||
            highlight.text != text)
        .toList();
  }

  void updateHighlightNote(
      String bookId, String chapterId, String text, String note) {
    state = state.map((highlight) {
      if (highlight.bookId == bookId &&
          highlight.chapterId == chapterId &&
          highlight.text == text) {
        return TextHighlight(
          bookId: highlight.bookId,
          chapterId: highlight.chapterId,
          pageNumber: highlight.pageNumber,
          text: highlight.text,
          color: highlight.color,
          note: note,
          createdAt: highlight.createdAt,
        );
      }
      return highlight;
    }).toList();
  }
}

final highlightsProvider =
    StateNotifierProvider<HighlightsNotifier, List<TextHighlight>>((ref) {
  return HighlightsNotifier();
});
