import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'CountDown Clock';

  Duration _duration = Duration(seconds: 10000);
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Direction Up & With Day',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SlideCountdownClock(
              duration: Duration(
                days: 24,
                minutes: 100,
              ),
              slideDirection: SlideDirection.Up,
              separator: ':',
              textStyle: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC41A3B),
              ),
              separatorTextStyle: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
              shouldShowDays: true,
              onDone: () => _key.currentState.showSnackBar(
                SnackBar(
                  content: Text('CountDown Finished.'),
                ),
              ),
            ),
            SizedBox(
              height: 98.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Direction Down & Without Day',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SlideCountdownClock(
              duration: Duration(
                days: 24,
                minutes: 100,
              ),
              slideDirection: SlideDirection.Down,
              separator: ':',
              textStyle: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B1F32),
              ),
              separatorTextStyle: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC41A3B),
              ),
              shouldShowDays: true,
              onDone: () => _key.currentState.showSnackBar(
                SnackBar(
                  content: Text('CountDown Finished.'),
                ),
              ),
            ),
            SizedBox(
              height: 98.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Using Decoration',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SlideCountdownClock(
              duration: _duration,
              slideDirection: SlideDirection.Up, // By default down side
              separator: ':',
              padding: EdgeInsets.all(16.0),
              textStyle: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFBE0E6),
              ),
              separatorTextStyle: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFC41A3B),
                shape: BoxShape.circle,
              ),
              onDone: () => _key.currentState.showSnackBar(
                SnackBar(
                  content: Text('CountDown Finished.'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
