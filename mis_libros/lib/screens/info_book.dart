import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/screens/views/tus_libros.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //titulo del libro
            Positioned(
                right: 0,
                left: 0,
                child: Text(
                  widget.libro.titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'RobotoSerif',
                      color: MisColores.marronOscuro4,
                      fontSize: 37,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, color: MisColores.nero),
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      widget.libro.autor,
                      style: const TextStyle(
                        fontFamily: 'RobotoSerif',
                        color: MisColores.nero,
                        fontSize: 25,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: MisColores.marronOscuro6,
              ),
              onRatingUpdate: (rating) {
                Logger().i(rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}
