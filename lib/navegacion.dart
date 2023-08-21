import 'package:flutter/material.dart';
import 'package:contador/pages/contador.dart';
import 'package:contador/pages/setting.dart';

class Navegacion extends StatefulWidget {
  final int counterValue;

  const Navegacion({Key? key, this.counterValue = 0}) : super(key: key);

  @override
  State<Navegacion> createState() => _Navegacion();
}

class _Navegacion extends State<Navegacion> {
  int index = 0;

  final List<Widget> list = [
    Contador(),
    Setting(),
  ];

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    list[0] = Contador(counterValue: widget.counterValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() => this.index = index);
            },
            children: list,
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
                unselectedItemColor: Colors.white,
                currentIndex: index,
                onTap: (int index) {
                  _pageController.jumpToPage(index);
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
