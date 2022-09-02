import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import 'alarm.dart';
import 'clock.dart';
import 'timer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 1;
  final widgetOptions = [
    Alarm(),
    const Clock(),
    const Timerr(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm,
                color: Colors.white,
              ),
              label: "Alarm"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.watch,
                color: Colors.white,
              ),
              label: "Clock"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.timer,
                color: Colors.white,
              ),
              label: "Timer"),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.white,
        onTap: onItemTapped,
        selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 20),
        unselectedFontSize: 16,
        unselectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 247, 235, 235),
            opacity: 1.0,
            size: 30.0),
        selectedIconTheme:
            const IconThemeData(color: Colors.white, opacity: 1.0, size: 30.0),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle:
            const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
