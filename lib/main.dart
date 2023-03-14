import 'package:flutter/material.dart';
import '../pages/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.deepPurple[200],
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
