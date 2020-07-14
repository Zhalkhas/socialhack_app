import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocation/geolocation.dart';

class MapWidget extends StatelessWidget {
  Future<CameraPosition> _getPosition() async {
    final GeolocationResult result =
    await Geolocation.requestLocationPermission(
      permission: const LocationPermission(
        android: LocationPermissionAndroid.coarse,
        ios: LocationPermissionIOS.always,
      ),
      openSettingsIfDenied: true,
    );

    if (result.isSuccessful) {
      print("permission granted");
      LocationResult result = await Geolocation.lastKnownLocation();
      var res = Geolocation.currentLocation(accuracy: LocationAccuracy.best);
      print("current location $res $result");
      Location current = result.location;
      return CameraPosition(
          target: LatLng(current.latitude, current.longitude));
    } else {
      print("well, fuck");
      // location permission is not granted
      // user might have denied, but it's also possible that location service is not enabled, restricted, and user never saw the permission request dialog. Check the result.error.type for details.
      return CameraPosition(target: LatLng(30, 50));
    }
//    LocationResult result = await Geolocation.currentLocation();
//    Position position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(title: const Text('GoogleMaps examples')),
        body: FutureBuilder(
            future: _getPosition(),
            builder:
                (BuildContext context, AsyncSnapshot<CameraPosition> snapshot) {
              if (snapshot.hasData) {
                return Card(
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: GoogleMap(
                      initialCameraPosition: snapshot.data,
//                        myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Text("Error: ${snapshot.error}"),
                );
              }
              else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
