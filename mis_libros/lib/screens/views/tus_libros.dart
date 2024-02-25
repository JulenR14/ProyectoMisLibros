import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';

class TusLibros extends StatefulWidget {
  const TusLibros({super.key});

  @override
  State<TusLibros> createState() => _TusLibros();
}

class _TusLibros extends State<TusLibros> {
  //libros que utlizamos para comprobar como se ve la lista de libros
  List<libro> listaLibros = [
    libro('El inversor\ninteligente', 'Benjamin Graham',
        'assets/images/librosPrueba/book_inversorInteligente.jpg'),
    libro('Padre rico,\npadre pobre', 'Robert Kiyosaki',
        'assets/images/librosPrueba/book_padreRicoPadrePobre.jpg'),
    libro('El hombre en\nbusca de sentido', 'Viktor Frankl',
        'assets/images/librosPrueba/book_hombreEnBuscaDeSentido.jpg'),
    libro('Piense y\nhágase rico', 'Napoleon Hill',
        'assets/images/librosPrueba/book_pienseYhagaseRico.jpg'),
    libro('El poder\ndel ahora', 'Eckhart Tolle',
        'assets/images/librosPrueba/book_poderDelAhora.jpg'),
    libro('El monje que\nvendio su ferrari', 'Robin Sharma',
        'assets/images/librosPrueba/book_monjeQueVendioSuFerrari.jpeg'),
    libro('Hábitos Atómicos', 'James Clear',
        'assets/images/librosPrueba/book_habitosAtomicos.jpg'),
    libro('El poder de\nlas Palabras', 'Mariano Sigman',
        'assets/images/librosPrueba/book_elPoderDeLasPalabras.jpg'),
    libro('Nunca te pares', 'Phil Knight',
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
    );
  }
}

//clase libro que utilizamos para crear los libros que se van a mostrar en la lista
class libro {
  String titulo;
  String autor;
  String imagen;
  libro(this.titulo, this.autor, this.imagen);
}
