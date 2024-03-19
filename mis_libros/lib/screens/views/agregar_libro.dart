import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/models/libro.dart';
import 'package:mis_libros/screens/views/tus_libros.dart';

// ignore: must_be_immutable
class AgregaLibro extends StatefulWidget {
  AgregaLibro({super.key});

  @override
  State<AgregaLibro> createState() => _AgregaLibro();
}

class _AgregaLibro extends State<AgregaLibro> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return Scaffold(
          backgroundColor: MisColores.marronOscuro1,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                    //MediaQuery.of(context).size.height y MediaQuery.of(context).size.width nos dan la altura y anchura de la pantalla
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top,
                    width: MediaQuery.of(context).size.width,
                    //Column es un widget que organiza a sus hijos en una columna vertical.
                    child: Column(
                      //mainAxisAlignment es una propiedad que alinea los hijos verticalmente.
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'Agrega un libro',
                            style: TextStyle(
                              color: MisColores.marronOscuro4,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        //Padding es un widget que añade un espacio alrededor de su hijo.
                        //Dentro de el tenemos un TextField que es un widget que permite al usuario escribir texto.
                        //En este caso el texto va a ser el titulo del libro que se quiere agregar.
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                //mostramos el icono del titulo al principio del TextField
                                prefixIcon: Icon(Icons.title),
                                labelText: 'Título Libro',
                                //rellenamos el TextField con un color transparente
                                fillColor: Colors.transparent,
                                filled: true,
                              ),
                            )),
                        //Padding es un widget que añade un espacio alrededor de su hijo.
                        //Dentro de el tenemos un TextField que es un widget que permite al usuario escribir texto.
                        //En este caso el texto va a ser el autor del libro que se quiere agregar.
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                //mostramos el icono del autor(persona) al principio del TextField
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Autor',
                                //rellenamos el TextField con un color transparente
                                fillColor: Colors.transparent,
                                filled: true,
                              ),
                            )),
                        //dejamos un espacio entre el TextField y la ratingBar
                        const SizedBox(
                          height: 20,
                        ),
                        //RatingBar es un widget que nos permite mostrar una barra de calificación
                        RatingBar.builder(
                          itemSize: 40,
                          initialRating: 0,
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
                            Logger().i(rating);
                          },
                        ),
                        const SizedBox(height: 20),
                        Card(
                          shadowColor: MisColores.marronOscuro6,
                          color: MisColores.marronOscuro2,
                          child: SizedBox(
                            width: 300,
                            height: MediaQuery.of(context).size.height - 450,
                            child: Stack(
                              children: [
                                Positioned(
                                    right: 0,
                                    left: 0,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              450,
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Descripción',
                                            //rellenamos el TextField con un color transparente
                                            fillColor: Colors.transparent,
                                            filled: true,
                                          ),
                                          maxLines: null,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    backgroundColor: MisColores.marronOscuro4,
                    onPressed: () {},
                    child: const Icon(Icons.check,
                        size: 35, color: MisColores.marronOscuro1),
                  ))
            ],
          ));
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Agregar Libro'),
        ),
      );
    }
  }
}
