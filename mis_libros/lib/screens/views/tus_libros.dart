import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/screens/info_book.dart';

class TusLibros extends StatefulWidget {
  const TusLibros({super.key});

  @override
  State<TusLibros> createState() => _TusLibros();
}

class _TusLibros extends State<TusLibros> {
  //libros que utlizamos para comprobar como se ve la lista de libros
  List<Libro> listaLibros = [
    Libro('El inversor\ninteligente', 'Benjamin Graham',
        'assets/images/librosPrueba/book_inversorInteligente.jpg'),
    Libro('Padre rico,\npadre pobre', 'Robert Kiyosaki',
        'assets/images/librosPrueba/book_padreRicoPadrePobre.jpg'),
    Libro('El hombre en\nbusca de sentido', 'Viktor Frankl',
        'assets/images/librosPrueba/book_hombreEnBuscaDeSentido.jpg'),
    Libro('Piense y\nhágase rico', 'Napoleon Hill',
        'assets/images/librosPrueba/book_pienseYhagaseRico.jpg'),
    Libro('El poder\ndel ahora', 'Eckhart Tolle',
        'assets/images/librosPrueba/book_poderDelAhora.jpg'),
    Libro('El monje que\nvendio su ferrari', 'Robin Sharma',
        'assets/images/librosPrueba/book_monjeQueVendioSuFerrari.jpeg'),
    Libro('Hábitos Atómicos', 'James Clear',
        'assets/images/librosPrueba/book_habitosAtomicos.jpg'),
    Libro('El poder de\nlas Palabras', 'Mariano Sigman',
        'assets/images/librosPrueba/book_elPoderDeLasPalabras.jpg'),
    Libro('Nunca te pares', 'Phil Knight',
        'assets/images/librosPrueba/book_nuncaTePares.jpg')
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
          elevation: 4,
          color: MisColores.marronOscuro1,
          child: SizedBox(
            height: 200,
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image(
                      image: AssetImage(listaLibros[i].imagen),
                      width: 100,
                      height: 150,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        listaLibros[i].titulo,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.5,
                            fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//clase libro que utilizamos para crear los libros que se van a mostrar en la lista
class Libro {
  String titulo;
  String autor;
  String imagen;
  Libro(this.titulo, this.autor, this.imagen);
}
