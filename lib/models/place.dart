import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocation({
    @override required this.latitude,
    @override required this.longitude,
    @override required this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;
  
  Place({
    @override required this.id,
    @override required this.title,
    @override required this.location,
    @override required this.image,
  });
  
}