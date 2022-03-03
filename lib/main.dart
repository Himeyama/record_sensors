import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "IBM Plex Sans JP"
      ),
      home: const MyHomePage(title: '計測アプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _ax = 0, _ay = 0, _az = 0;
  double _gx = 0, _gy = 0, _gz = 0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _ax = event.x;
        _ay = event.y;
        _az = event.z;
      });
    });

    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gx = event.x;
        _gy = event.y;
        _gz = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16),
              child: const Text("加速度", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), textAlign: TextAlign.left)
            ),
            Container(
                // color: Colors.grey,
                alignment: Alignment.topLeft,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text("X: ${_ax.toStringAsFixed(3)} m/s²"),
                        // style: const TextStyle(fontWeight: FontWeight.bold))
                    Text("Y: ${_ay.toStringAsFixed(3)} m/s²"),
                    Text("Z: ${_az.toStringAsFixed(3)} m/s²")
                  ],
                )),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16),
              child: const Text("角速度", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), textAlign: TextAlign.left)
            ),
            Container(
                // color: Colors.grey,
                alignment: Alignment.topLeft,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text("X: ${_gx.toStringAsFixed(3)} m/s²"),
                    Text("Y: ${_gy.toStringAsFixed(3)} m/s²"),
                    Text("Z: ${_gz.toStringAsFixed(3)} m/s²")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
