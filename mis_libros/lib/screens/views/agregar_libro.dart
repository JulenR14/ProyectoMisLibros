import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/models/libro.dart';

// ignore: must_be_immutable
class AgregaLibro extends StatefulWidget {
  AgregaLibro({super.key});

  @override
  State<AgregaLibro> createState() => _AgregaLibro();
}

class _AgregaLibro extends State<AgregaLibro> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: MisColores.marronOscuro1,
        body: Stack(children: [
          //titulo de la pantalla
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Text(
              'Agrega un libro',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'RobotoSerif',
                  color: MisColores.marronOscuro4,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]));
  }
}
