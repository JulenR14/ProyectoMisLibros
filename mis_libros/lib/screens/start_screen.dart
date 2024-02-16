import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
        body:  SingleChildScrollView(
          child: Container(
            color: Colors.marron5,
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png',
                scale: 3.5),
                const SizedBox(height: 20),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Correo',
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                    )
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        labelText: 'Contraseña',
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                    )
                ),
              ],
            )
          ),
        )
    );
  }
}