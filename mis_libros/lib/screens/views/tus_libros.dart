import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/models/libro.dart';
import 'package:mis_libros/screens/info_book.dart';

class TusLibros extends StatefulWidget {
  const TusLibros({super.key});

  @override
  State<TusLibros> createState() => _TusLibros();
}

class _TusLibros extends State<TusLibros> {
  //libros que utlizamos para comprobar como se ve la lista de libros
  List<Libro> listaLibros = [
    Libro(
        'El inversor inteligente',
        'Benjamin Graham',
        'assets/images/librosPrueba/book_inversorInteligente.jpg',
        4.5,
        "El inversor inteligente es un libro de inversión escrito por Benjamin Graham en 1949. El libro es ampliamente considerado como uno de los mejores libros de inversión de todos los tiempos. Graham propone un método para encontrar empresas infravaloradas y actuar en consecuencia."),
    Libro(
        'Padre rico, padre pobre',
        'Robert Kiyosaki',
        'assets/images/librosPrueba/book_padreRicoPadrePobre.jpg',
        2,
        "Padre rico, padre pobre es un libro de finanzas personales escrito por Robert Kiyosaki y Sharon Lechter. Fue publicado por primera vez en 1997. El libro aboga por la importancia de la educación financiera, incluyendo la inversión, la gestión de activos, la formación de corporaciones y el uso de estrategias fiscales."),
    Libro(
        'El hombre en busca de sentido',
        'Viktor Frankl',
        'assets/images/librosPrueba/book_hombreEnBuscaDeSentido.jpg',
        3,
        "El hombre en busca de sentido es un libro de psicología escrito por Viktor Frankl. El libro relata sus experiencias como prisionero en campos de concentración durante la Segunda Guerra Mundial, y describe su método para encontrar un motivo para vivir."),
    Libro(
        'Piense y hágase rico',
        'Napoleon Hill',
        'assets/images/librosPrueba/book_pienseYhagaseRico.jpg',
        5,
        "Piense y hágase rico es un libro de autoayuda escrito por Napoleon Hill. Fue publicado por primera vez en 1937. El libro está basado en una serie de entrevistas a Andrew Carnegie, que Hill realizó durante 25 años y que le sirvieron de base para su filosofía del éxito."),
    Libro(
        'El poder del ahora',
        'Eckhart Tolle',
        'assets/images/librosPrueba/book_poderDelAhora.jpg',
        4,
        "El poder del ahora es un libro de espiritualidad escrito por Eckhart Tolle. Fue publicado por primera vez en 1997. El libro defiende la importancia de la atención plena y la meditación en la vida diaria."),
    Libro(
        'El monje que vendio su ferrari',
        'Robin Sharma',
        'assets/images/librosPrueba/book_monjeQueVendioSuFerrari.jpeg',
        1,
        "El monje que vendió su Ferrari es un libro de autoayuda escrito por Robin Sharma. Fue publicado por primera vez en 1997. El libro relata la historia de Julian Mantle, un abogado que, tras sufrir un ataque al corazón, abandona su carrera y se va a la India."),
    Libro(
        'Hábitos Atómicos',
        'James Clear',
        'assets/images/librosPrueba/book_habitosAtomicos.jpg',
        4,
        "Hábitos atómicos es un libro de autoayuda escrito por James Clear. Fue publicado por primera vez en 2018. El libro defiende la importancia de los pequeños cambios en la vida diaria para lograr grandes resultados."),
    Libro(
        'El poder de las Palabras',
        'Mariano Sigman',
        'assets/images/librosPrueba/book_elPoderDeLasPalabras.jpg',
        3,
        "El poder de las palabras es un libro de psicología escrito por Mariano Sigman. Fue public"),
    Libro(
        'Nunca te pares',
        'Phil Knight',
        'assets/images/librosPrueba/book_nuncaTePares.jpg',
        5,
        "Nunca te pares es un libro de autobiografía escrito por Phil Knight. Fue publicado por primera vez en 2016. El libro relata la historia de la creación de Nike."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //cambiamos el color del fondo de la pantalla
        backgroundColor: MisColores.marronOscuro4,
        //en el body de la pantalla se muestra una lista de libros
        //los cuales son los libros que tiene agregado el usuario como leidos
        body: ListView.builder(
            //indicamos que cantidad de libros se van a mostrar
            itemCount: listaLibros.length,
            //va creando automaticamente cada una de las cards de los libros
            itemBuilder: (BuildContext context, int index) {
              return crearListaCards(index);
            }));
  }

  /// Este metodo se encarga de crear las cards que se van a mostrar en la lista
  /// segun el indice que le pasa el metodo builder
  Widget crearListaCards(int i) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InfoLibro(libro: listaLibros[i])));
          },
          child: Card(
            shadowColor: MisColores.nero,
            color: MisColores.marronOscuro1,
            child: SizedBox(
              height: 200,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Hero(
                      tag: listaLibros[i].imagen,
                      child: Image(
                        image: AssetImage(listaLibros[i].imagen),
                        width: 100,
                        height: 150,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 180,
                    child: Positioned(
                      right: 0,
                      left: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Hero(
                              tag: listaLibros[i].titulo,
                              child: Text(
                                listaLibros[i].titulo,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'InriaSerif',
                                    color: MisColores.marronOscuro4,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              listaLibros[i].autor,
                              style: const TextStyle(
                                  fontFamily: 'InriaSerif',
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
