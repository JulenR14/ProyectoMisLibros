import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/models/libro.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class InfoLibro extends StatefulWidget {
  InfoLibro({super.key, required this.libro, required this.libroAgregado});
  Libro libro;
  bool libroAgregado;

  @override
  State<InfoLibro> createState() => _InfoLibro();
}

/**
 * Esta clase se encarga de mostrar la pantalla de informacion de un libro
 */
class _InfoLibro extends State<InfoLibro> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return Scaffold(
        backgroundColor: MisColores.marronOscuro1,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        //utilizo el row para centrar el contenido a la mitad de la pantalla horizontalmente
        body: Center(
          child: Stack(children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //titulo del libro y su imagen
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Hero(
                                tag: "${widget.libro.imagen}tuslibros",
                                child: Image(
                                  image: AssetImage(widget.libro.imagen),
                                  width: 100,
                                  height: 130,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 140,
                              width: MediaQuery.of(context).size.width - 180,
                              child: Stack(children: [
                                Positioned(
                                    right: 0,
                                    left: 0,
                                    child: SizedBox(
                                      height: 140,
                                      width: MediaQuery.of(context).size.width -
                                          180,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.libro.titulo,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: 'RobotoSerif',
                                                color: MisColores.marronOscuro4,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ))
                              ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //espacio entre la imagen y el titulo
                const SizedBox(height: 30),
                //icono y autor del libro
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
                //espacio entre el titulo y el icono
                const SizedBox(height: 30),
                //Si la variable libroAgregado es true se muestra el ratingbar
                //solo sera true si el libro pulsado es de la lista de libros leidos
                widget.libroAgregado
                    ? RatingBar.builder(
                        itemSize: 40,
                        initialRating: widget.libro.valoracion,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: MisColores.marronOscuro6,
                        ),
                        onRatingUpdate: (rating) {
                          widget.libro.valoracion = rating;
                          Logger().i(rating);
                        },
                      )
                    : const SizedBox(),
                //espacio entre el ratingbar y la descripcion
                const SizedBox(height: 30),
                //descripcion del libro
                Card(
                  shadowColor: MisColores.marronOscuro6,
                  color: MisColores.marronOscuro2,
                  //SizedBox establece el tamaño de la carta
                  child: SizedBox(
                    width: 300,
                    height: MediaQuery.of(context).size.height - 400,
                    //Stack se utiliza para poder superponer los elementos
                    child: Stack(
                      children: [
                        //Positioned limita el espacio en el que se puede mostrar el texto
                        Positioned(
                          right: 0,
                          left: 0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height -
                                400, // Asegúrate de que el Container tenga una altura definida
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  widget.libro.descripcion,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'RobotoSerif',
                                      color: MisColores.nero,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text("Informacion del libro ${widget.libro.titulo}"),
        ),
      );
    }
  }
}
