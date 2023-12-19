import 'package:flutter/material.dart';
import 'package:location_test/services/location_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return StreamProvider<UserLocation>(
        initialData: UserLocation(latitude: 0.0, longitude: 0.0),
        create: (context) => LocationService().locationStream,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Scaffold(
              body: HomeView(),
            )),
      );
    }
  }
class HomeView extends StatelessWidget {
    const HomeView({super.key});
    @override
    Widget build(BuildContext context) {
      var userLocation = Provider.of<UserLocation>(context);
      return Center(
        child: Text(
            'Lat: ${userLocation.latitude}, Long: ${userLocation.longitude}'),
      );
    }
  }