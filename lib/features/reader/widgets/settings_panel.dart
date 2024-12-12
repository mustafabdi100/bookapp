// lib/features/reader/widgets/settings_panel.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reader_settings_provider.dart';

class ReaderSettingsPanel extends ConsumerWidget {
  const ReaderSettingsPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(readerSettingsProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: settings.isDarkMode ? Colors.grey[900] : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Font Size Control
          Row(
            children: [
              Icon(
                Icons.text_fields,
                color: settings.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Slider(
                  value: settings.fontSize,
                  min: 12,
                  max: 24,
                  onChanged: (value) {
                    ref
                        .read(readerSettingsProvider.notifier)
                        .updateFontSize(value);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Font Family Selection
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final font in ['Georgia', 'Roboto', 'Times New Roman'])
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        font,
                        style: TextStyle(
                          fontFamily: font,
                          color: settings.fontFamily == font
                              ? Colors.white
                              : (settings.isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                      selected: settings.fontFamily == font,
                      onSelected: (selected) {
                        if (selected) {
                          ref
                              .read(readerSettingsProvider.notifier)
                              .updateFontFamily(font);
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Theme Toggle
          SwitchListTile(
            title: Text(
              'Dark Mode',
              style: TextStyle(
                color: settings.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            value: settings.isDarkMode,
            onChanged: (_) {
              ref.read(readerSettingsProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
