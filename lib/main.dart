import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
//  import 'src/manager/driver_manager.dart';
// import 'package:flutter/rendering.dart';
import 'src/screens/start_app.dart';

void main() {
  // debugPaintSizeEnabled=true;
  MapView.setApiKey("AIzaSyB7yLqn6MURvJHRsPKCWRvAdyfQXFsK2vM");
  runApp(Start());
}
