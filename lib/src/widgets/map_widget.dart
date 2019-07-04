// import 'package:flutter/material.dart';
// // import 'package:map_view/map_view.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/location_model.dart';
// // import '../helpers/ensure_visible.dart';

// class StaticMap extends StatefulWidget {
//   final String origin;
//   final String destination;
//   StaticMap(this.origin, this.destination);
//   @override
//   State<StatefulWidget> createState() {
//     return StaticMapWidget();
//   }
// }

// class StaticMapWidget extends State<StaticMap> {
//   // final FocusNode _addressInputFocusNode = FocusNode();
//   Uri _staticMapUri;
// LocationData _locationData;
//   @override
//   void initState() {
//     // _addressInputFocusNode.addListener(_updateLocation);
//     // getStaticMap(widget.origin);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // _addressInputFocusNode.removeListener(_updateLocation);
//     super.dispose();
//   }

//   // void getStaticMap(String address) async {
//   //   if (address.isEmpty) {
//   //     return;
//   //   }
//   //   final Uri uri = Uri.https('maps.googleapis.com', '/maps/api/geocode/json',
//   //       {'address': address, 'key': 'AIzaSyB7yLqn6MURvJHRsPKCWRvAdyfQXFsK2vM'});
//   //   final http.Response response = await http.get(uri);
//   //   final decodedResponse = json.decode(response.body);

//   //   final formattedAddress = decodedResponse['results'][0]['formatted_address'];
//   //   final coords = decodedResponse['results'][0]['geometry']['location'];
//   //   print(formattedAddress);
//   //   _locationData = LocationData(
//   //       address: formattedAddress,
//   //       latitude: coords['lat'],
//   //       longitude: coords['lng']);
//   //   final StaticMapProvider staticMapViewProvider =
//   //       StaticMapProvider('AIzaSyB7yLqn6MURvJHRsPKCWRvAdyfQXFsK2vM');
//   //   final Uri staticMapUri = staticMapViewProvider.getStaticUriWithMarkers(
//   //       [Marker('position', 'Position', _locationData.latitude, _locationData.longitude)],
//   //       center: Location(_locationData.latitude, _locationData.longitude ),
//   //       //  width:500,
//   //       //  height:300,
//   //       maptype: StaticMapViewType.roadmap);
//   //   setState(() {
//   //     _staticMapUri = staticMapUri;
//   //   });
//   // }

// //  void _updateLocation(){

// //  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: IconTheme.of(context),
//         centerTitle: true,
//         title: Text(
//           'Navigate',
//           style: TextStyle(color: Colors.white, fontSize: 21.0),
//         ),
//       ),
//       body: Center(
//           child: Column(
//         children: <Widget>[
//           // EnsureVisibleWhenFocused(
//           //   focusNode: _addressInputFocusNode,
//           //   child: TextFormField(
//           //     focusNode: _addressInputFocusNode,
//           //   ),
//           // ),
//           Image.network(_staticMapUri.toString()),
//         ],
//       )),
//     );
//   }
// }
