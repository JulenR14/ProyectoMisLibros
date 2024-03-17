import 'package:flutter/material.dart';
import 'package:mis_libros/colors/colors.dart';
import 'package:mis_libros/screens/home.dart';

class PopRegistrer {
  static void showRegisterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //AlertDialog es un widget que muestra un diálogo simple.
        return AlertDialog(
            backgroundColor: MisColores.marronOscuro2,
            //titulo de el dialogo de registro
            title: const Padding(
              padding: EdgeInsets.only(bottom: 5, top: 5),
              child: Text('Regístrate',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
            //contenido del dialogo de registro
            //SingleChildScrollView es un widget que permite desplazar su contenido si es demasiado grande para caber en la pantalla
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: SingleChildScrollView(
                child: Column(
                  //ponemos todos los valores a rellenar para registrar al usuario
                  children: <Widget>[
                    const SizedBox(height: 20, width: 10),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Nombre de usuario',
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Apellidos',
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Correo electrónico',
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MisColores.dim_gray),
                        //modificamos el borde del boton
                        shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                            //le pasamos un widget de tipo RoundedRectangleBorder para modificar el borde
                            const RoundedRectangleBorder(
                          //alineamos al centro horizontalmente
                          //le pasamos un radio de 8 para que sea el borde un poco redondeado pero no tanto como el por defecto
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        )),
                      ),
                      //Row va a agrupar sus hijos en fila
                      child: Row(
                        //alineamos al centro horizontalmente
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //muestra el texto del boton, con un padding para separar el logo de Google con el
                          Padding(
                            padding: EdgeInsets.symmetric(
                                //para el padding horizantal se utiliza una operacion para que el padding sea el 7.5% del ancho de la pantalla
                                //esto es para que el padding sea proporcional al tamaño de la pantalla
                                horizontal:
                                    (7.5 * MediaQuery.of(context).size.width) /
                                        100,
                                vertical: 10),
                            child: const Text(
                              "Registrar",
                              style: TextStyle(
                                  color: MisColores.gainsboro, fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        //aqui se navegara a la pantalla de registro
                        //Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
