import 'dart:async';

import 'package:geolocator/geolocator.dart';

abstract class Bloc{
  void dispose();
}

class MyOrdersBloc implements Bloc{
  Position _position;
  Position get selectedLocation => _position;

  final  _locationController = StreamController<Position>();
  Stream<Position> get locationStream => _locationController.stream;


  void actualLocation(Position location){
    _position = location;
    _locationController.sink.add(location);
  }

  @override
  void dispose() {
    _locationController.close();
  }
}