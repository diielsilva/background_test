import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool location = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página Inicial"),
      ),
      body: Center(
        child: Column(
          children: [
            location
                ? Text("Localização iniciada")
                : Text("Localização não iniciada"),
            ElevatedButton(
              child: Text("Ativar Localização"),
              onPressed: () async {
                LocationPermission permission =
                    await Geolocator.requestPermission();
                if (permission != LocationPermission.denied ||
                    permission != LocationPermission.deniedForever) {
                  setState(() {
                    location = true;
                  });
                }
              },
            ),
            ElevatedButton(
              child: Text("Ver localização"),
              onPressed: () async {
                Position actualLocation = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);

                print(actualLocation.latitude);
                print(actualLocation.longitude);
              },
            ),
          ],
        ),
      ),
    );
  }
}
