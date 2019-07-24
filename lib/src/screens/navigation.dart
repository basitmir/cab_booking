import 'package:flutter/material.dart';
// import 'package:map_view/map_view.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
// import '../models/location_model.dart';
// import 'package:location/location.dart' as geoloc;


class Navigate extends StatefulWidget {
  final String origin;
  final String destination;
  Navigate(this.origin, this.destination);
  @override
  State<StatefulWidget> createState() {
    return NavigateLocation();
  }
}

class NavigateLocation extends State<Navigate> {


  // Uri _staticMapUri;
  // LocationData _locationData;
  @override
  void initState() {
   
    if(widget.origin!=null){
    // getStaticMap(widget.origin, geocode: false);
    }
    else{
      // getUserLocation();
    }

    super.initState();
  }

  @override
  void dispose() {
   
    super.dispose();
  }

  // Future<String> _getAddress(double lat, double lng) async {
  //   final Uri uri = Uri.https('maps.googleapis.com', '/maps/api/geocode/json', {
  //     'latlng': '${lat.toString()},${lng.toString()}',
  //     'key': 'AIzaSyB7yLqn6MURvJHRsPKCWRvAdyfQXFsK2vM'
  //   });
  //   final http.Response response = await http.get(uri);
  //   final decodeResponse = json.decode(response.body);
  //   final formattedAddress = decodeResponse['results'][0]['formatted_address'];
  //   return formattedAddress;
  // }

  // void getUserLocation() async {
  //   final location = geoloc.Location();
  //   final currentLocation = await location.getLocation();
  //   final address =
  //       await _getAddress(currentLocation['latitude'], currentLocation['longitude']);
  //   getStaticMap(address,
  //       geocode: false,
  //       lat: currentLocation['latitude'],
  //       lng: currentLocation['longitude']);
  // }

  // void getStaticMap(String address,
  //     {geocode = true, double lat, double lng}) async {
  //   if (address.isEmpty) {
  //     return;
  //   }
  //   if (geocode) {
  //     final Uri uri = Uri.https(
  //         'maps.googleapis.com', '/maps/api/geocode/json', {
  //       'address': address,
  //       'key': 'AIzaSyB7yLqn6MURvJHRsPKCWRvAdyfQXFsK2vM'
  //     });
  //     final http.Response response = await http.get(uri);
  //     final decodedResponse = json.decode(response.body);

  //     final formattedAddress =
  //         decodedResponse['results'][0]['formatted_address'];
  //     final coords = decodedResponse['results'][0]['geometry']['location'];
  //     print(formattedAddress);
  //     _locationData = LocationData(
  //         address: formattedAddress,
  //         latitude: coords['lat'],
  //         longitude: coords['lng']);

  //   }else {
  //     _locationData =
  //         LocationData(address: address, latitude: lat, longitude: lng);
  //   }
  //     final StaticMapProvider staticMapViewProvider =
  //         StaticMapProvider('AIzaSyB7yLqn6MURvJHRsPKCWRvAdyfQXFsK2vM');
  //     final Uri staticMapUri = staticMapViewProvider.getStaticUriWithMarkers([
  //       Marker('position', 'Position', _locationData.latitude,
  //           _locationData.longitude)
  //     ],
  //         center: Location(_locationData.latitude, _locationData.longitude),
  //          width:500,
  //          height:300,
  //         maptype: StaticMapViewType.roadmap);
  //     setState(() {
  //       _staticMapUri = staticMapUri;
  //     });
  //   } 
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Navigate',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body:  
     
      
      Center(
          child: 
          Column(
        children: <Widget>[
          // Image.network(_staticMapUri.toString()),
        ],
      ),
      ),
    );
  }
}
