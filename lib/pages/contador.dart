import 'package:contador/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:contador/navegacion.dart';

class Contador extends StatefulWidget {
  // final int counterValue;
  final String image;
  final int configuration;
  final void Function(String background) onBackgroundChange;

  const Contador(
      {Key? key,
      required this.image,
      required this.configuration,
      required this.onBackgroundChange})
      : super(key: key);
// Haz que counterValue sea opcional y tenga un valor predeterminado

  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int _counter = 0;

  @override
  void initState() {
    super.initState(); // Asignar el valor aquí
  }

  void _incrementCounter() {
    setState(() {
      if (widget.configuration == 0) {
        _counter++;
      } else {
        _counter = _counter + widget.configuration;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (widget.configuration == 0) {
        _counter--;
      } else {
        _counter = _counter - widget.configuration;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.image), // Ruta de tu imagen de fondo
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Cambiar el fondo",
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => widget.onBackgroundChange(
                          "assets/images/fondopantalla.jpeg"),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/fondopantalla.jpeg",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(6),
                        backgroundColor: Colors
                            .white, // <-- Button color // <-- Splash color
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => widget.onBackgroundChange(
                          "assets/images/fondopantalla2.jpg"),
                      child: ClipOval(
                        child: Image.asset("assets/images/fondopantalla2.jpg",
                            width: 70, height: 70, fit: BoxFit.cover),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(6),
                        backgroundColor: Colors
                            .white, // <-- Button color // <-- Splash color
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Text('$_counter',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 150,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15)),
                      child: const Icon(
                        Icons.remove,
                        size: 20,
                      ),
                      onPressed: _decrementCounter,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(40)),
                      child: Text('Limpiar',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      onPressed: _resetCounter,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15)),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                      onPressed: _incrementCounter,
                    ),
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
