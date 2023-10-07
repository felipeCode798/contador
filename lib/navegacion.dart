import 'package:flutter/material.dart';
import 'package:contador/pages/contador.dart';
import 'package:contador/pages/setting.dart';

class Navegacion extends StatefulWidget {
  const Navegacion({Key? key}) : super(key: key);

  @override
  State<Navegacion> createState() => _Navegacion();
}

class _Navegacion extends State<Navegacion> {
  int index = 0;
  int counterValue = 0;
  String image = "assets/images/fondopantalla.jpeg";

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              if (index == 1) {
                return Setting();
              }
              return Contador(
                image: image,
                configuration: counterValue,
                onBackgroundChange: (background) {},
              );
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              child: BottomNavigationBar(
                backgroundColor:
                    Colors.transparent, // Color de fondo transparente
                elevation: 0, // Sin sombra
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(0.5),
                currentIndex: index,
                onTap: (int index) {
                  print(index);
                  //_pageController.jumpToPage(index);
                  setState(() => this.index = index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.access_time),
                    label: 'Contador',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Setting',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
