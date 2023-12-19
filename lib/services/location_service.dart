import 'dart:async';

import 'package:location/location.dart';

class UserLocation {
  final double latitude;
  final double longitude;
  UserLocation({required this.latitude, required this.longitude});
}

/* 

Usage:

  class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return StreamProvider<UserLocation>(
        builder: (context) => LocationService().locationStream,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
              body: HomeView(),
            )),
      );
    }
  }

  Then in our HomeView we will consume that stream and print out the location values.

  class HomeView extends StatelessWidget {
    const HomeView({Key key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      var userLocation = Provider.of<UserLocation>(context);
      return Center(
        child: Text(
            'Location: Lat${userLocation?.latitude}, Long: ${userLocation?.longitude}'),
      );
    }
  }
*/

class LocationService {
  var location = Location();

  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted ||
          permissionStatus == PermissionStatus.grantedLimited) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged.listen((locationData) {
          double lat = 0.0;
          double lon = 0.0;
          if (locationData.latitude != null && locationData.longitude != null) {
            lat = locationData.latitude!;
            lon = locationData.longitude!;
            _locationController.add(UserLocation(
              latitude: lat,
              longitude: lon,
            ));
          }
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    UserLocation ret = UserLocation(latitude: 0.0, longitude: 0.0);
    double lat = 0.0;
    double lon = 0.0;
    try {
      var userLocation = await location.getLocation();

      if (userLocation.latitude != null && userLocation.longitude != null) {
        lat = userLocation.latitude!;
        lon = userLocation.longitude!;
      }

      if (userLocation.latitude != null && userLocation.longitude != null) {
        ret = UserLocation(
          latitude: lat,
          longitude: lon,
        );
      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print('Could not get location: ${e.toString()}');
    }
    return ret;
  }
}
