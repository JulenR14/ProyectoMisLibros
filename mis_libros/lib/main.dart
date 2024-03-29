import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'KaiseiDecol',
        colorScheme: ColorScheme.fromSeed(seedColor: MisColores.marronOscuro6),
        useMaterial3: true,
      ),
      home: const StartScreen(),
    );
  }
}
