import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/screens/views/tus_libros.dart';

class InfoLibro extends StatefulWidget {
  InfoLibro({super.key, required this.libro});
  Libro libro;

  @override
  State<InfoLibro> createState() => _InfoLibro();
}

class _InfoLibro extends State<InfoLibro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MisColores.marronOscuro1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      //utilizo el row para centrar el contenido a la mitad de la pantalla horizontalmente
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //el column lo utilizo para ademas de agrupar el contenido en vertical, alinearlo
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //titulo del libro
              Padding(
                  padding: const EdgeInsets.all(35),
                  child: Text(
                    widget.libro.titulo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'RobotoSerif',
                        color: MisColores.marronOscuro4,
                        //fontSize:(15 * MediaQuery.of(context).size.width) / 100
                        ),
                  )),
              //autor del libro
              Text(
                widget.libro.autor,
                style: const TextStyle(
                    fontFamily: 'RobotoSerif',
                    color: MisColores.marronOscuro4,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
