import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng DEST_LOCATION = LatLng(19.3299332, -99.0887086);

class MapsNavigation extends StatefulWidget{
  _MapsNavigationState createState() => _MapsNavigationState();
}

class _MapsNavigationState extends State<MapsNavigation>{
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = 'AIzaSyCLHKzz3MwAHpMSjcf-OKUgT-QKs4imHKA';
// for my custom icons
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  Position currentLocation;
  Geolocator location;


  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
    setInitialPosition();
  }

  void setInitialPosition() async{
    location = Geolocator();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 10);

    currentLocation = await location.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    location.getPositionStream(locationOptions).listen((cLoc) {
      currentLocation = cLoc;
      updatePinOnMap();

    });

  }
  void updatePinOnMap() async {

    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(currentLocation.latitude,
          currentLocation.longitude),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition = LatLng(currentLocation.latitude,
          currentLocation.longitude);

      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      _markers.removeWhere(
              (m) => m.markerId.value == "sourcePin");
      _markers.add(Marker(
          markerId: MarkerId("sourcePin"),
          position: pinPosition, // updated position
          icon: sourceIcon
      ));
      setPolylines();

    });
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 0.5),
        'assets/images/ubicacion.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 0.5),
        'assets/images/ubicacion.png');
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: LatLng(19.3299332, -99.0887086)
    );
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude,
              currentLocation.longitude),
          zoom: CAMERA_ZOOM,
          tilt: CAMERA_TILT,
          bearing: CAMERA_BEARING
      );
    }


    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      tiltGesturesEnabled: false,
      markers: _markers,
      polylines: _polylines,
      mapType: MapType.normal,
      initialCameraPosition: initialCameraPosition,
      onMapCreated: onMapCreated,
      zoomControlsEnabled: false,
    );

  }
  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setMapPins();
    setPolylines();
  }
  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          icon: sourceIcon
      ));
      _markers.add(Marker(
          markerId: MarkerId('destPin'),
          position: DEST_LOCATION,
          icon: destinationIcon
      ));
    });
  }
  setPolylines() async {
    PolylineResult result = await
    polylinePoints.getRouteBetweenCoordinates(googleAPIKey, PointLatLng(currentLocation.latitude, currentLocation.longitude), PointLatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude));
    if(result.points.isNotEmpty){
      if(polylineCoordinates.length !=0 ){
        polylineCoordinates.removeRange(0, polylineCoordinates.length);
      }
      result.points.forEach((PointLatLng point){
        polylineCoordinates.add(
            LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Colors.black,
          points: polylineCoordinates,
          width: 3
      );
      _polylines.add(polyline);
    });
  }


}

