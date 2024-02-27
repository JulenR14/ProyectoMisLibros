import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/models/libro.dart';
import 'package:mis_libros/screens/views/tus_libros.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image(
                      image: AssetImage(widget.libro.imagen),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 180,
                    child: Positioned(
                        right: 0,
                        left: 0,
                        child: Text(
                          widget.libro.titulo,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'RobotoSerif',
                              color: MisColores.marronOscuro4,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
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
                        fontSize: 20,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 30),
            RatingBar.builder(
              itemSize: 55,
              initialRating: widget.libro.valoracion,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: MisColores.marronOscuro6,
              ),
              onRatingUpdate: (rating) {
                widget.libro.valoracion = rating;
                Logger().i(rating);
              },
            ),
            const SizedBox(height: 30),
            Card(
              color: MisColores.marronOscuro4,
              child: SizedBox(
                width: 300,
                height: MediaQuery.of(context).size.height - 400,
                child: Positioned(
                    right: 0,
                    left: 0,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(widget.libro.descripcion,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'RobotoSerif',
                                color: MisColores.nero,
                                fontSize: 20,
                                fontWeight: FontWeight.normal)),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
