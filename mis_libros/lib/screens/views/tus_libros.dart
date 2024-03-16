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
      //con el GestureDetector se le indica que cuando se toque la card se va a abrir la pantalla de informacion del libro
      child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        InfoLibro(libro: listaLibros[i], libroAgregado: true)));
          },
          //se crea la carta del libro
          child: Card(
            shadowColor: MisColores.nero,
            color: MisColores.marronOscuro1,
            //SizeBox se utiliza para daerle un tamaño a la carta
            child: SizedBox(
              height: 200,
              //Row se utiliza para poder alinear los elementos de la carta en una sola fila
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //El primer elemento la carta va a ser la imagen
                  //en la que se aplica con Hero una animacion de transicion
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Hero(
                      tag:
                          "${listaLibros[i].imagen}tuslibros", //se le asigna un tag para poder hacer la animacion en la otra pantalla
                      child: Image(
                        image: AssetImage(listaLibros[i].imagen),
                        width: 100,
                        height: 150,
                      ),
                    ),
                  ),
                  //El segundo elemento de la carta va a ser el titulo y el autor del libro
                  SizedBox(
                    height: 200,
                    //la anchura de este elemento va a ser el ancho de la pantalla menos 180
                    width: MediaQuery.of(context).size.width - 180,
                    //Stack se utiliza para poder superponer los elementos
                    //gracias a Stack podemos poner el titulo y autor sin que se salga del limite de la carta
                    //por el positioned
                    child: Stack(children: [
                      //Positioned limita el espacio en el que se puede mostrar el texto
                      Positioned(
                        right: 0,
                        left: 0,
                        //establecemos el tamaño en el que se tiene que mostrar la columna del texto del titulo y autor
                        //sin el SizedBox no podriamos centrar el Column porque coge los limites del positiones
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //el titulo del libro
                              Padding(
                                padding: const EdgeInsets.all(10),
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
                              //el autor del libro
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
                    ]),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
