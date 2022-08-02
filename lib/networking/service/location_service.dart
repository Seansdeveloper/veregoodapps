

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
class CurrentLocation{
 static  Future<String>  currentPosition() async {
    LocationPermission permission;
    String Address="";



    Position position;
    permission = await Geolocator.checkPermission();;
    if (permission == LocationPermission.denied) {
      permission= await Geolocator.requestPermission();
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = ' ${place.locality}, ${place.postalCode}, ${place.country}';
    print(Address);
    return Address;
  }
}
