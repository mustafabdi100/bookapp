// lib/features/reader/pages/reader_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reader_settings_provider.dart';
import '../widgets/settings_panel.dart';
import '../models/chapter_content.dart';
import '../widgets/page_turn_effect.dart';

class ReaderPage extends ConsumerStatefulWidget {
  final String bookId;
  final String chapterTitle;

  const ReaderPage({
    super.key,
    required this.bookId,
    required this.chapterTitle,
  });

  @override
  ConsumerState<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends ConsumerState<ReaderPage>
    with SingleTickerProviderStateMixin {
  bool _showSettings = false;
  late PageController _pageController;
  int _currentPage = 0;
  String? _selectedText;
  double _dragPosition = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_updatePage);
  }

  @override
  void dispose() {
    _pageController.removeListener(_updatePage);
    _pageController.dispose();
    super.dispose();
  }

  void _updatePage() {
    int page = _pageController.page?.round() ?? 0;
    if (page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  void _goToNextPage() {
    if (_currentPage < chapterOneContent.pages.length - 1) {
      setState(() {
        _dragPosition = 1.0;
      });
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _currentPage++;
          _dragPosition = 0;
        });
      });
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _dragPosition = -1.0;
      });
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _currentPage--;
          _dragPosition = 0;
        });
      });
    }
  }

  Widget _buildPage(int pageIndex) {
    if (pageIndex < 0 || pageIndex >= chapterOneContent.pages.length) {
      return Container();
    }

    final settings = ref.watch(readerSettingsProvider);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: settings.isDarkMode ? Colors.black : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SelectableText(
          chapterOneContent.pages[pageIndex],
          style: TextStyle(
            fontSize: settings.fontSize,
            height: 1.8,
            color: settings.isDarkMode ? Colors.white : Colors.black,
            fontFamily: settings.fontFamily,
          ),
          onSelectionChanged: (selection, cause) {
            if (!_isDragging) {
              setState(() {
                _selectedText = selection.textInside(
                  chapterOneContent.pages[pageIndex],
                );
              });
              if (_selectedText?.isNotEmpty == true) {
                _showHighlightOptions();
              }
            }
          },
        ),
      ),
    );
  }

  void _showHighlightOptions() {
    if (_selectedText == null) return;

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_selectedText ?? ''),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Highlight'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Copy'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(readerSettingsProvider);

    return Scaffold(
      backgroundColor: settings.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: settings.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Page ${_currentPage + 1} of ${chapterOneContent.pages.length}',
              style: TextStyle(
                color: settings.isDarkMode ? Colors.white70 : Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    chapterOneContent.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: settings.isDarkMode ? Colors.white : Colors.black,
                      fontFamily: settings.fontFamily,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onHorizontalDragStart: (_) {
                      setState(() {
                        _isDragging = true;
                      });
                    },
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        _dragPosition -= details.delta.dx /
                            MediaQuery.of(context).size.width;
                        _dragPosition = _dragPosition.clamp(-1.0, 1.0);
                      });
                    },
                    onHorizontalDragEnd: (details) {
                      final velocity = details.primaryVelocity ?? 0;
                      setState(() {
                        _isDragging = false;
                        if (_dragPosition.abs() > 0.2 || velocity.abs() > 300) {
                          if (_dragPosition < 0 && _currentPage > 0) {
                            _currentPage--;
                          } else if (_dragPosition > 0 &&
                              _currentPage <
                                  chapterOneContent.pages.length - 1) {
                            _currentPage++;
                          }
                        }
                        _dragPosition = 0;
                      });
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Next page
                        if (_currentPage < chapterOneContent.pages.length - 1 &&
                            _dragPosition > 0)
                          PageTurnWidget(
                            dragValue: 0,
                            isForward: false,
                            showCurvedShadow: false,
                            child: _buildPage(_currentPage + 1),
                          ),
                        // Previous page
                        if (_currentPage > 0 && _dragPosition < 0)
                          PageTurnWidget(
                            dragValue: 0,
                            isForward: true,
                            showCurvedShadow: false,
                            child: _buildPage(_currentPage - 1),
                          ),
                        // Current page
                        PageTurnWidget(
                          dragValue: _dragPosition,
                          isForward: _dragPosition < 0,
                          child: _buildPage(_currentPage),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: settings.isDarkMode ? Colors.black : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: _currentPage > 0 ? _goToPreviousPage : null,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Previous'),
                      ),
                      TextButton.icon(
                        onPressed:
                            _currentPage < chapterOneContent.pages.length - 1
                                ? _goToNextPage
                                : null,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Next'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_showSettings)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: const ReaderSettingsPanel(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showSettings = !_showSettings;
          });
        },
        child: Icon(
          _showSettings ? Icons.close : Icons.settings,
          color: settings.isDarkMode ? Colors.black : Colors.white,
        ),
        backgroundColor: settings.isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
