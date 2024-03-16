import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/data/libros_data.dart';
import 'package:mis_libros/screens/info_book.dart';

class BuscarLibros extends StatefulWidget {
  const BuscarLibros({super.key});

  @override
  State<BuscarLibros> createState() => _BuscarLibros();
}

class _BuscarLibros extends State<BuscarLibros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MisColores.marronOscuro1,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Row(
              children: [
                //con el expanded hacemos que el TextField ocupe todo el espacio que le queda disponible
                //en la fila dejando el espacio suficiente para el boton de buscar
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Titulo del libro',
                        fillColor: Colors.transparent),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Aquí puedes poner la lógica de búsqueda
                  },
                  child: const Icon(Icons.search,
                      color: MisColores.marronOscuro4, size: 40),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
                itemCount: listaLibros.length,
                itemBuilder: (BuildContext context, int index) {
                  return _crearListaCards(index);
                }),
          ),
        ]),
      ),
    );
  }

  Widget _crearListaCards(int i) {
    return Padding(
      padding: EdgeInsets.all(10),
      /*child: GestureDetector(
          onTap: () {
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InfoLibro(libro: listaLibros[i])));*/
          },*/
      child: Card(
        shadowColor: MisColores.nero,
        color: MisColores.marronOscuro4,
        child: SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                //child: Hero(
                //tag: "${listaLibros[i].imagen}tuslibros",
                child: Image(
                  image: AssetImage(listaLibros[i].imagen),
                  width: 100,
                  height: 150,
                ),
              ),
              //),
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
                          //child: Hero(
                          //tag: listaLibros[i].titulo,
                          child: Text(
                            listaLibros[i].titulo,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'InriaSerif',
                                color: MisColores.marronOscuro1,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          //),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            listaLibros[i].autor,
                            style: const TextStyle(
                                fontFamily: 'InriaSerif',
                                color: MisColores.marronOscuro1,
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
      ), //),
    );
  }
}
