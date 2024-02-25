import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';

class BuscarLibros extends StatefulWidget {
  const BuscarLibros({super.key});

  @override
  State<BuscarLibros> createState() => _BuscarLibros();
}

class _BuscarLibros extends State<BuscarLibros> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MisColores.marronOscuro1,
      body: Center(
        child: Text('Busca un nuevo libro'),
      ),
    );
  }
}
