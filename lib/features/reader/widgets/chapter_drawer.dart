// lib/features/reader/widgets/chapter_drawer.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chapter_content.dart';
import '../providers/bookmark_provider.dart';
import '../providers/highlight_provider.dart';

class ChapterDrawer extends ConsumerWidget {
  final String bookId;
  final Function(String chapterId) onChapterSelected;

  const ChapterDrawer({
    super.key,
    required this.bookId,
    required this.onChapterSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);
    final highlights = ref.watch(highlightsProvider);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Center(
              child: Text(
                'Contents',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DefaultTabController(
            length: 3,
            child: Expanded(
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Chapters'),
                      Tab(text: 'Bookmarks'),
                      Tab(text: 'Highlights'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Chapters Tab
                        ListView(
                          children: [
                            ListTile(
                              title: const Text('Chapter One'),
                              subtitle: const Text('The Beginning'),
                              onTap: () => onChapterSelected('chapter-1'),
                            ),
                            // Add more chapters
                          ],
                        ),
                        // Bookmarks Tab
                        ListView.builder(
                          itemCount: bookmarks.length,
                          itemBuilder: (context, index) {
                            final bookmark = bookmarks[index];
                            return ListTile(
                              leading: const Icon(Icons.bookmark),
                              title: Text('Page ${bookmark.pageNumber + 1}'),
                              subtitle: Text(bookmark.note),
                              onTap: () =>
                                  onChapterSelected(bookmark.chapterId),
                            );
                          },
                        ),
                        // Highlights Tab
                        ListView.builder(
                          itemCount: highlights.length,
                          itemBuilder: (context, index) {
                            final highlight = highlights[index];
                            return ListTile(
                              leading: Icon(Icons.format_quote,
                                  color: highlight.color),
                              title: Text(
                                highlight.text,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: highlight.note != null
                                  ? Text(highlight.note!)
                                  : null,
                              onTap: () =>
                                  onChapterSelected(highlight.chapterId),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
