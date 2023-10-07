import 'package:flutter/material.dart';
import 'package:contador/navegacion.dart';

class Setting extends StatefulWidget {
  //TODO PEDIR POR CONTRUCTOR EL IMAGE
  //TODO CALLBACK CAMBIAR EL CONFIGURATION

  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String _image = "assets/images/fondopantalla.jpeg";
  int _counter = 0; // Variable para almacenar el contador
  final TextEditingController _controller =
      TextEditingController(); // Controlador del TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_image), // Ruta de tu imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Cuanto va incrementar? ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
                const SizedBox(height: 10),
                Container(
                  width: 350,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "1,2,3... ",
                      hintStyle: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(30),
                      backgroundColor:
                          Colors.blueAccent.shade400.withOpacity(0.5)),
                  child: Text('Mostrar',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  onPressed: () {
                    try {
                      _counter = int.parse(_controller.text);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         Navegacion(counterValue: _counter),
                      //   ),
                      // );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Por favor, ingresa un número válido.')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
