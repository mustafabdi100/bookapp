// lib/features/reader/providers/reader_settings_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReaderSettings {
  final double fontSize;
  final String fontFamily;
  final bool isDarkMode;
  final double brightness;

  const ReaderSettings({
    this.fontSize = 16.0,
    this.fontFamily = 'Georgia',
    this.isDarkMode = false,
    this.brightness = 1.0,
  });

  ReaderSettings copyWith({
    double? fontSize,
    String? fontFamily,
    bool? isDarkMode,
    double? brightness,
  }) {
    return ReaderSettings(
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      brightness: brightness ?? this.brightness,
    );
  }
}

final readerSettingsProvider =
    StateNotifierProvider<ReaderSettingsNotifier, ReaderSettings>((ref) {
  return ReaderSettingsNotifier();
});

class ReaderSettingsNotifier extends StateNotifier<ReaderSettings> {
  ReaderSettingsNotifier() : super(const ReaderSettings());

  void updateFontSize(double size) {
    state = state.copyWith(fontSize: size);
  }

  void toggleTheme() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void updateFontFamily(String family) {
    state = state.copyWith(fontFamily: family);
  }

  void updateBrightness(double brightness) {
    state = state.copyWith(brightness: brightness);
  }
}
