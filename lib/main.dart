import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'widgets/app_bar.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/video_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube Home Page',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
