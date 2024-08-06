import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(33.5093553, 36.2939167),
          
            initialZoom: 20,
            onTap: (_,latlng){
              setState(() {
                 tappedPoints.add(latlng);
                 debugPrint(latlng.toString());
              });
             
              }
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(33.5093553, 36.2939167),
                  width: 80,
                  height: 80,
                  child: Icon(Icons.pin_drop,size: 60,),
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(33.50, 36.20),
                  width: 80,
                  height: 80,
                  child: Icon(Icons.home),
                ),
              ],
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      
    );
  }
}

List<LatLng> tappedPoints = [
  const LatLng(51.5,-0.09),
  const LatLng(51.506678,-0.097124) 
];