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
  List<String> listaBusqueda = [
    "prueba1",
    "prueba2",
    "prueba3",
    "prueba4",
    "prueba5",
    "prueba6",
    "prueba7",
    "prueba8",
    "prueba9",
    "prueba10",
    "prueba11",
    "prueba12",
    "prueba13",
    "prueba14",
    "prueba15",
    "prueba16",
    "prueba17",
    "prueba18",
    "prueba19",
    "prueba20",
    "prueba21",
    "prueba22",
    "prueba23",
    "prueba24",
    "prueba25",
    "prueba26",
    "prueba27",
    "prueba28",
    "prueba29",
    "prueba30",
    "prueba31",
    "prueba32",
    "prueba33",
    "prueba34",
    "prueba35",
    "prueba36",
    "prueba37",
    "prueba38",
    "prueba39",
    "prueba40",
    "prueba41",
    "prueba42",
    "prueba43",
    "prueba44",
    "prueba45",
    "prueba46",
    "prueba47",
    "prueba48",
    "prueba49",
    "prueba50",
    "prueba51",
    "prueba52",
    "prueba53",
    "prueba54",
    "prueba55",
    "prueba56",
    "prueba57",
    "prueba58",
    "prueba59",
    "prueba60",
    "prueba61",
    "prueba62",
    "prueba63",
    "prueba64",
    "prueba65",
    "prueba66",
    "prueba67",
    "prueba68",
    "prueba69",
    "prueba70",
    "prueba71",
    "prueba72",
    "prueba73",
    "prueba74",
    "prueba75",
    "prueba76",
    "prueba77",
    "prueba78",
    "prueba79",
    "prueba80",
    "prueba81",
    "prueba82",
    "prueba83",
    "prueba84",
    "prueba85",
    "prueba86",
    "prueba87",
    "prueba88",
    "prueba89",
    "prueba90",
    "prueba91",
    "prueba92",
    "prueba93",
    "prueba94",
    "prueba95",
    "prueba96",
    "prueba97",
    "prueba98",
    "prueba99",
    "prueba100"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MisColores.marronOscuro1,
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
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
        Expanded(
          child: ListView.builder(
              itemCount: listaBusqueda.length,
              itemBuilder: (BuildContext context, int index) {
                return _crearListaCards(index);
              }),
        ),
      ]),
    );
  }

  Widget _crearListaCards(int i) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        shadowColor: MisColores.nero,
        color: MisColores.marronOscuro1,
        child: SizedBox(height: 200, child: Center(child: Text("Prueba"))),
      ),
    );
  }

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
