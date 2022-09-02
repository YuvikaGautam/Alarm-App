import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import 'alarm.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('ALARM CLOCK'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            DigitalClock(
              digitAnimationStyle: Curves.decelerate,
              is24HourTimeFormat: true,
              areaDecoration: BoxDecoration(
                  color: Colors.black, border: Border.all(color: Colors.black)),
              hourMinuteDigitTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),
              hourMinuteDigitDecoration: BoxDecoration(
                  color: Colors.black, border: Border.all(color: Colors.black)),
              secondDigitTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),
              secondDigitDecoration: BoxDecoration(
                  color: Colors.black, border: Border.all(color: Colors.black)),
              amPmDigitTextStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
