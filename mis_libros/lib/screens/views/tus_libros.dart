import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/data/libros_data.dart';
import 'package:mis_libros/models/libro.dart';
import 'package:mis_libros/screens/info_book.dart';

class TusLibros extends StatefulWidget {
  const TusLibros({super.key});

  @override
  State<TusLibros> createState() => _TusLibros();
}

class _TusLibros extends State<TusLibros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //ME GUSTARIA COLOCAR UN MENU EN EL QUE SE PUEDA CAMBIAR A LOS LIBROS POR LEER O A LOS LIBROS LEIDOS
        /*appBar: AppBar(
          title: const Text('Tus Libros'),
          backgroundColor: MisColores.marronOscuro4,
        ),*/
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Hero(
                      tag: "${listaLibros[i].imagen}tuslibros",
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
                    child: Stack(children: [
                      Positioned(
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
                      )
                    ]),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
