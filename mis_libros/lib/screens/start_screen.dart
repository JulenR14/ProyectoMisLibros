import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/screens/home.dart';
import 'package:mis_libros/screens/pop_registrer.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreen();
}

class _prueba extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(currentWidth.toString())],
      ),
    );
  }
}

class _StartScreen extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    // Scaffold es un widget que implementa el diseño visual básico de la mayoría de las aplicaciones de Material Design.
    if (MediaQuery.of(context).size.width < 600 &&
        MediaQuery.of(context).size.height > 700) {
      return Scaffold(
          //ponemos el fondo de la app en marron5
          backgroundColor: MisColores.marronOscuro1,
          //SingleChildScrollView es un widget que permite desplazarse hacia arriba y hacia abajo.
          body: SingleChildScrollView(
            //ClampingScrollPhysics es un tipo de ScrollPhysics que no permite que el contenido se desplace más allá de sus límites.
            physics: const ClampingScrollPhysics(),
            //SizedBox es un widget que impone un tamaño fijo a su hijo.
            child: SizedBox(
                //MediaQuery.of(context).size.height y MediaQuery.of(context).size.width nos dan la altura y anchura de la pantalla
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                width: MediaQuery.of(context).size.width,
                //Column es un widget que organiza a sus hijos en una columna vertical.
                child: Column(
                  //mainAxisAlignment es una propiedad que alinea los hijos verticalmente.
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Este widget carga la imagen del logo de nuestra app
                    Image.asset('assets/images/Logo.png', scale: 4),
                    //Padding es un widget que añade un espacio alrededor de su hijo.
                    //Dentro de el tenemos un TextField que es un widget que permite al usuario escribir texto.
                    //En este caso el texto va a ser el correo de el usuario para hacer el inicio de sesión.
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            //mostramos el icono del correo al principio del TextField
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Correo',
                            //rellenamos el TextField con un color transparente
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                        )),
                    //Padding es un widget que añade un espacio alrededor de su hijo.
                    //Dentro de el tenemos un TextField que es un widget que permite al usuario escribir texto.
                    //En este caso el texto va a ser la contraseña de el usuario para hacer el inicio de sesión.
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            //mostramos el icono de la contraseña al principio del TextField
                            prefixIcon: Icon(Icons.key),
                            labelText: 'Contraseña',
                            //rellenamos el TextField con un color transparente
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                        )),
                    //En este widget se va a mostrar el botón de iniciar sesión
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 20),
                        //imponemos el tamaño dle boton, el color de fondo y el texto que va a mostrar
                        child: SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MisColores.marronOscuro4),
                            ),
                            child: const Center(
                              child: Text(
                                "Iniciar Sesion",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                            //cuando se presione el boton comprobara los datos del usuario y iniciara sesion
                            //si no existe el usuario lo llevara a la pantalla de registro
                            onPressed: () {
                              //aqui se llamara al metodo que implementara el inicio de sesion
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                          ),
                        )),
                    //En este widget se va a mostrar el botón de registro
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 20),
                        //imponemos el tamaño dle boton, el color de fondo y el texto que va a mostrar
                        child: SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MisColores.marronOscuro4),
                            ),
                            child: const Center(
                              child: Text(
                                "Registrate",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                            //cuando se presione el boton llevara al usuario a la pantalla de registro
                            onPressed: () {
                              //aqui se navegara a la pantalla de registro
                              PopRegistrer.showRegisterDialog(context);
                            },
                          ),
                        )),
                    //En este widget se va a mostrar el botón de iniciar sesion con google
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 20),
                        //imponemos el tamaño dle boton, el color de fondo, el texto que va a mostrar y su icono
                        child: SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              //modificamos el borde del boton
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  //le pasamos un widget de tipo RoundedRectangleBorder para modificar el borde
                                  const RoundedRectangleBorder(
                                      //le pasamos un radio de 8 para que sea el borde un poco redondeado pero no tanto como el por defecto
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      //cambiamos el color y groso del borde
                                      side: BorderSide(
                                          width: 2.5,
                                          color: Colors.black) // Borde negro
                                      )),
                            ),
                            //Row va a agrupar sus hijos en fila
                            child: Row(
                              //alineamos al centro horizontalmente
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //Este widget mostrara la imagen de el logo de google en formato svg
                                SvgPicture.asset(
                                  'assets/images/Google__G__logo.svg',
                                  height: 30,
                                  width: 30,
                                ),
                                //muestra el texto del boton, con un padding para separar el logo de Google con el
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      //para el padding horizantal se utiliza una operacion para que el padding sea el 7.5% del ancho de la pantalla
                                      //esto es para que el padding sea proporcional al tamaño de la pantalla
                                      horizontal: (7.5 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                          100),
                                  child: const Text(
                                    "Iniciar Sesion",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              //aqui se llamara al metodo que implementara el inicio de sesion con google
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                          ),
                        ))
                  ],
                )),
          ));
    } else {
      return Scaffold(
          //ponemos el fondo de la app en marron5
          backgroundColor: MisColores.marronOscuro1,
          //SingleChildScrollView es un widget que permite desplazarse hacia arriba y hacia abajo.
          body: SingleChildScrollView(
            //ClampingScrollPhysics es un tipo de ScrollPhysics que no permite que el contenido se desplace más allá de sus límites.
            physics: const ClampingScrollPhysics(),
            //SizedBox es un widget que impone un tamaño fijo a su hijo.
            child: SizedBox(
                //MediaQuery.of(context).size.height y MediaQuery.of(context).size.width nos dan la altura y anchura de la pantalla
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                width: MediaQuery.of(context).size.width,
                //Column es un widget que organiza a sus hijos en una columna vertical.
                child: Column(
                  //mainAxisAlignment es una propiedad que alinea los hijos verticalmente.
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Este widget carga la imagen del logo de nuestra app
                    Image.asset('assets/images/Logo.png', scale: 15),
                    //Padding es un widget que añade un espacio alrededor de su hijo.
                    //Dentro de el tenemos un TextField que es un widget que permite al usuario escribir texto.
                    //En este caso el texto va a ser el correo de el usuario para hacer el inicio de sesión.
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: TextField(
                          decoration: InputDecoration(
                            //mostramos el icono del correo al principio del TextField
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Correo',
                            //rellenamos el TextField con un color transparente
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                        )),
                    //Padding es un widget que añade un espacio alrededor de su hijo.
                    //Dentro de el tenemos un TextField que es un widget que permite al usuario escribir texto.
                    //En este caso el texto va a ser la contraseña de el usuario para hacer el inicio de sesión.
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: TextField(
                          decoration: InputDecoration(
                            //mostramos el icono de la contraseña al principio del TextField
                            prefixIcon: Icon(Icons.key),
                            labelText: 'Contraseña',
                            //rellenamos el TextField con un color transparente
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                        )),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      //En este widget se va a mostrar el botón de iniciar sesión
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          //imponemos el tamaño dle boton, el color de fondo y el texto que va a mostrar
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    MisColores.marronOscuro4),
                              ),
                              child: const Center(
                                child: Text(
                                  "Iniciar Sesion",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              //cuando se presione el boton comprobara los datos del usuario y iniciara sesion
                              //si no existe el usuario lo llevara a la pantalla de registro
                              onPressed: () {
                                //aqui se llamara al metodo que implementara el inicio de sesion
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              },
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          //imponemos el tamaño dle boton, el color de fondo y el texto que va a mostrar
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    MisColores.marronOscuro4),
                              ),
                              child: const Center(
                                child: Text(
                                  "Registrate",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              //cuando se presione el boton comprobara los datos del usuario y iniciara sesion
                              //si no existe el usuario lo llevara a la pantalla de registro
                              onPressed: () {
                                //aqui se navegara a la pantalla de registro
                                PopRegistrer.showRegisterDialog(context);
                              },
                            ),
                          )),
                    ]),
                    //En este widget se va a mostrar el botón de iniciar sesion con google
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        //imponemos el tamaño dle boton, el color de fondo, el texto que va a mostrar y su icono
                        child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              //modificamos el borde del boton
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  //le pasamos un widget de tipo RoundedRectangleBorder para modificar el borde
                                  const RoundedRectangleBorder(
                                      //le pasamos un radio de 8 para que sea el borde un poco redondeado pero no tanto como el por defecto
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      //cambiamos el color y groso del borde
                                      side: BorderSide(
                                          width: 2.5,
                                          color: Colors.black) // Borde negro
                                      )),
                            ),
                            //Row va a agrupar sus hijos en fila
                            child: Row(
                              //alineamos al centro horizontalmente
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //Este widget mostrara la imagen de el logo de google en formato svg
                                SvgPicture.asset(
                                  'assets/images/Google__G__logo.svg',
                                  height: 20,
                                  width: 20,
                                ),
                                //muestra el texto del boton, con un padding para separar el logo de Google con el
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      //para el padding horizantal se utiliza una operacion para que el padding sea el 7.5% del ancho de la pantalla
                                      //esto es para que el padding sea proporcional al tamaño de la pantalla
                                      horizontal: (7.5 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                          100),
                                  child: const Text(
                                    "Iniciar Sesion",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              //aqui se llamara al metodo que implementara el inicio de sesion con google
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                          ),
                        ))
                  ],
                )),
          ));
    }
  }
}
