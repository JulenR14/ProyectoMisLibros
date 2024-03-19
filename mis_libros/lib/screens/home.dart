import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/screens/views/agregar_libro.dart';
import 'package:mis_libros/screens/views/buscar_libros.dart';
import 'package:mis_libros/screens/views/tus_libros.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int indexSeleccionado = 0;

  setIndice(int index) {
    setState(() {
      indexSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Lista de pantallas que se van a mostrar segun la seleccion del usuario en la appBar
    final screens = [
      const TusLibros(),
      AgregaLibro(),
      const BuscarLibros(),
    ];
    // Scaffold es un widget que implementa el diseño visual básico de la mayoría de las aplicaciones de Material Design.
    return Scaffold(
      backgroundColor: MisColores.marronOscuro4,
      //IndexedStack nos va a permitit mostrar la pantalla que corresponda segun el indice de la appBar
      //y mantener el estado de las pantallas que no se estan mostrando
      body: IndexedStack(
        index: indexSeleccionado,
        children: screens,
      ),
      //BottomNavigationBar es un widget que implementa la barra de navegación en la parte inferior de la pantalla
      bottomNavigationBar: BottomNavigationBar(
        //BottomNavigationBarType es un enum que nos permite cambiar el tipo de la barra de navegación
        //shifting es un tipo de barra de navegación que cambia de color segun la selección
        type: BottomNavigationBarType.shifting,
        //cambia el color de el icono seleccionado segun en que pantalla estemos
        selectedItemColor: colorIcono(),
        currentIndex: indexSeleccionado,
        //onTap es una función que se ejecuta cuando se selecciona un item de la barra de navegación
        //modificamos el indice seleccionado segun la seleccion del usuario
        onTap: (seleccion) => setState(() => indexSeleccionado = seleccion),
        elevation: 8,
        //items seran los items que se mostraran en la barra de navegación
        //segun en que pantalla este el usuario cambiara el color de los iconos
        items: <BottomNavigationBarItem>[
          //se crea el item para acceder a los libros leidos del usuario
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: colorIcono(), size: 30),
              label: 'Tus Libros',
              backgroundColor: MisColores.marronOscuro2),
          //se crea el item para agregar un libro a la lista de libros leidos
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: colorIcono(), size: 30),
            label: 'Agregar',
            backgroundColor: MisColores.marronOscuro3,
          ),
          //se crea el item para buscar un nuevo libro en la base de datos
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: colorIcono(), size: 30),
            label: 'Buscar Libro',
            backgroundColor: MisColores.marronOscuro5,
          ),
        ],
      ),
    );
  }

  Color colorIcono() {
    switch (indexSeleccionado) {
      case 0:
        return MisColores.marronOscuro6;
      case 1:
        return MisColores.negro;
      case 2:
        return MisColores.marronOscuro1;
      default:
        return MisColores.negro;
    }
  }
}
