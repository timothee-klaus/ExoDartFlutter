import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogueApp());
}

class CatalogueApp extends StatelessWidget {
  const CatalogueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalogue App',
      home: const CatalogueApp(),
    );
  }
}
 