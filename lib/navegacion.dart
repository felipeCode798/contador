import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:contador/pages/contador.dart';
import 'package:contador/pages/setting.dart';

class Navegacion extends StatefulWidget {
  const Navegacion({super.key});

  @override
  State<Navegacion> createState() => _Navegacion();
}

class _Navegacion extends State<Navegacion> {
  final items = const [
    Icon(Icons.access_time, size: 30, color: Colors.white),
    Icon(Icons.settings, size: 30, color: Colors.white),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blue,
          color: Colors.blueAccent.shade400.withOpacity(0.5),
          animationDuration: const Duration(milliseconds: 200),
          items: items,
          index: index,
          height: 60,
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          }),
      body: Container(
        child: getSelectedWidget(index: index),
      ),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  switch (index) {
    case 0:
      return const Contador();
    case 1:
      return const Setting();
    default:
      return const Contador();
  }
}
