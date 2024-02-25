import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';

class AgregaLibro extends StatefulWidget {
  const AgregaLibro({super.key});

  @override
  State<AgregaLibro> createState() => _AgregaLibro();
}

class _AgregaLibro extends State<AgregaLibro> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MisColores.marronOscuro1,
      body: Center(
        child: Text('Agrega un Libro'),
      ),
    );
  }
}
