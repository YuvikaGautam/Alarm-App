import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';

class Timerr extends StatefulWidget {
  const Timerr({Key? key}) : super(key: key);

  @override
  State<Timerr> createState() => _TimerrState();
}

class _TimerrState extends State<Timerr> {
  TimeOfDay _time = TimeOfDay.now();
  late int h, m;
  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  void settime(hour, minute) {
    setState(() {
      h = hour;

      m = minute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('TIMER'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            createInlinePicker(
              elevation: 1,
              value: _time,
              onChange: onTimeChanged,
              onChangeDateTime: (DateTime dateTime) {
                print(dateTime.minute);
                print(dateTime.hour);
                setState(() {
                  settime(dateTime.hour, dateTime.minute);
                });
              },
              minuteInterval: MinuteInterval.ONE,
              iosStylePicker: true,
              minHour: 00,
              maxHour: 23,
              is24HrFormat: true,
            ),
            Container(
              height: 50.0,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () {
                  FlutterAlarmClock.createTimer(m);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AboutDialog(
                          children: [
                            Center(
                              child: Text("TIME IS SET",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 4, 46, 108),
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        );
                      });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 91, 137, 243),
                          Color(0xff1FD1F9)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      // gradient: LinearGradient(
                      //   colors: [
                      //     Color.fromARGB(255, 245, 172, 238),
                      //     Color.fromARGB(255, 89, 83, 209),
                      //   ],
                      //   begin: Alignment.centerLeft,
                      //   end: Alignment.centerRight,
                      // ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "CREATE TIMER",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50.0,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () {
                  FlutterAlarmClock.showTimers();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 91, 137, 243),
                          Color(0xff1FD1F9)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "SHOW TIMERS",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
