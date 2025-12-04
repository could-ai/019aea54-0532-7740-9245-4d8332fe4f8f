import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungary Train Map',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TrainMapScreen(),
      },
    );
  }
}

class TrainMapScreen extends StatefulWidget {
  const TrainMapScreen({super.key});

  @override
  State<TrainMapScreen> createState() => _TrainMapScreenState();
}

class _TrainMapScreenState extends State<TrainMapScreen> {
  // Center of Hungary
  static const LatLng _initialCenter = LatLng(47.1625, 19.5033);
  static const double _initialZoom = 7.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hungary Train Map'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: _initialCenter,
          initialZoom: _initialZoom,
          // Constrain map to roughly Hungary/Central Europe to prevent getting lost
          minZoom: 6.0,
          maxZoom: 18.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.couldai_user_app',
            // It's important to provide attribution for OpenStreetMap
            subdomains: const ['a', 'b', 'c'],
          ),
          // Placeholder for train markers later
          const MarkerLayer(
            markers: [],
          ),
          // Attribution widget
          const RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
