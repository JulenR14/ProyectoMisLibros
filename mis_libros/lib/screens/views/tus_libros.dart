import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';

class TusLibros extends StatefulWidget {
  const TusLibros({super.key});

  @override
  State<TusLibros> createState() => _TusLibros();
}

class _TusLibros extends State<TusLibros> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MisColores.marronOscuro4,
      body: Center(
        child: Text('Tus libros'),
      ),
    );
  }
}
