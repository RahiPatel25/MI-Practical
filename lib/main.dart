import 'package:flutter/material.dart';
import 'package:mi_practical/di/dependency_injection.dart' as di;
import 'package:mi_practical/modules/home/presentation/pages/home_page.dart';

void main() {
  di.diInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MI Practical',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
