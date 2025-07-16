import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const BulkingCessApp());
}

class BulkingCessApp extends StatelessWidget {
  const BulkingCessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BulkingCess',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen(),
    );
  }
}
