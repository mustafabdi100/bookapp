import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/home/pages/home_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: BookJunctionApp(),
    ),
  );
}

class BookJunctionApp extends ConsumerWidget {
  const BookJunctionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Book Junction',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A4A4A),
        ),
      ),
      home: const HomePage(),
    );
  }
}
