// lib/features/reader/providers/reader_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReaderSettings {
  final double fontSize;
  final double lineHeight;
  final String fontFamily;
  final double brightness;
  final bool isDarkMode;
  final Color backgroundColor;
  final Color textColor;

  ReaderSettings({
    this.fontSize = 16.0,
    this.lineHeight = 1.8,
    this.fontFamily = 'Georgia',
    this.brightness = 1.0,
    this.isDarkMode = false,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
  });

  ReaderSettings copyWith({
    double? fontSize,
    double? lineHeight,
    String? fontFamily,
    double? brightness,
    bool? isDarkMode,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return ReaderSettings(
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      fontFamily: fontFamily ?? this.fontFamily,
      brightness: brightness ?? this.brightness,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }
}

class ReaderProgress {
  final int currentPage;
  final int totalPages;
  final double scrollPosition;
  final String currentChapter;
  final Duration timeLeft;

  ReaderProgress({
    required this.currentPage,
    required this.totalPages,
    required this.scrollPosition,
    required this.currentChapter,
    required this.timeLeft,
  });
}

class ReaderState {
  final ReaderSettings settings;
  final ReaderProgress progress;
  final bool isSettingsOpen;
  final ScrollController scrollController;

  ReaderState({
    required this.settings,
    required this.progress,
    this.isSettingsOpen = false,
    required this.scrollController,
  });
}

class ReaderNotifier extends StateNotifier<ReaderState> {
  ReaderNotifier()
      : super(
          ReaderState(
            settings: ReaderSettings(),
            progress: ReaderProgress(
              currentPage: 1,
              totalPages: 1,
              scrollPosition: 0,
              currentChapter: 'Chapter One',
              timeLeft: const Duration(minutes: 20),
            ),
            scrollController: ScrollController(),
          ),
        );

  void updateFontSize(double size) {
    state = ReaderState(
      settings: state.settings.copyWith(fontSize: size),
      progress: state.progress,
      isSettingsOpen: state.isSettingsOpen,
      scrollController: state.scrollController,
    );
  }

  void toggleTheme() {
    final isDark = !state.settings.isDarkMode;
    state = ReaderState(
      settings: state.settings.copyWith(
        isDarkMode: isDark,
        backgroundColor: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        textColor: isDark ? Colors.white70 : Colors.black87,
      ),
      progress: state.progress,
      isSettingsOpen: state.isSettingsOpen,
      scrollController: state.scrollController,
    );
  }

  void updateBrightness(double brightness) {
    state = ReaderState(
      settings: state.settings.copyWith(brightness: brightness),
      progress: state.progress,
      isSettingsOpen: state.isSettingsOpen,
      scrollController: state.scrollController,
    );
  }

  void updateFontFamily(String fontFamily) {
    state = ReaderState(
      settings: state.settings.copyWith(fontFamily: fontFamily),
      progress: state.progress,
      isSettingsOpen: state.isSettingsOpen,
      scrollController: state.scrollController,
    );
  }

  void toggleSettings() {
    state = ReaderState(
      settings: state.settings,
      progress: state.progress,
      isSettingsOpen: !state.isSettingsOpen,
      scrollController: state.scrollController,
    );
  }

  void updateProgress() {
    final scrollPosition = state.scrollController.position.pixels;
    final maxScroll = state.scrollController.position.maxScrollExtent;
    final progress = scrollPosition / maxScroll;

    // Calculate current page based on scroll position
    final currentPage = ((progress * state.progress.totalPages) + 1).floor();

    // Calculate time left based on reading speed (assuming 200 words per minute)
    final wordsLeft = (state.progress.totalPages - currentPage) *
        250; // Assuming 250 words per page
    final minutesLeft = (wordsLeft / 200).ceil();

    state = ReaderState(
      settings: state.settings,
      progress: ReaderProgress(
        currentPage: currentPage,
        totalPages: state.progress.totalPages,
        scrollPosition: progress,
        currentChapter: state.progress.currentChapter,
        timeLeft: Duration(minutes: minutesLeft),
      ),
      isSettingsOpen: state.isSettingsOpen,
      scrollController: state.scrollController,
    );
  }
}

final readerProvider =
    StateNotifierProvider<ReaderNotifier, ReaderState>((ref) {
  return ReaderNotifier();
});
