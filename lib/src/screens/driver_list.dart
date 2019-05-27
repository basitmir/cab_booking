import 'package:flutter/material.dart';
// import '../models/driver_model.dart';

class DriverList extends StatelessWidget {
  // final List<DriverModel> drivers;
  final List drivers;
  DriverList(this.drivers);

 Widget _singleListItem(BuildContext context, int index) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
      child: Column(
        children: <Widget>[
          rowContainer(drivers[index]),
          Image.asset(
            'assets/car.jpg',
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }

  Widget build(context) {
    return ListView.builder(
      itemBuilder: _singleListItem,
      itemCount: drivers.length,

      // children: [
      //   Column(
      //     children: drivers
      //         .map((element) => Card(
      //               color: Colors.white,
      //               margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
      //               child: Column(
      //                 children: <Widget>[
      //                   rowContainer(element),
      //                   Image.asset(
      //                     'assets/car.jpg',
      //                   ),
      //                   Icon(
      //                     Icons.star,
      //                     color: Colors.yellow,
      //                   ),
      //                 ],
      //               ),
      //             ))
      //         .toList(),
      //   ),
      // ],
    );
  }
}

Widget rowContainer(String element) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.centerLeft,
          colors: [Colors.orange[400], Colors.white]),
    ),
    margin: EdgeInsets.fromLTRB(6.0, 4.0, 0.0, 1.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        avatar(),
        Container(margin: EdgeInsets.only(left: 10.00)),
        avatarText(element),
        Spacer(),
        avatarMore(),
      ],
    ),
  );
}

Widget avatar() {
  return CircleAvatar(
    radius: 30.0,
    // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
    backgroundColor: Colors.black12,
    child: Text(
      'Test',
      style: TextStyle(color: Colors.white, fontSize: 12.0),
    ),
  );
}

Widget avatarText(String element) {
  return Column(
    children: <Widget>[
      Text(
        element,
        style: TextStyle(
            color: Colors.black87, fontSize: 15.0, fontWeight: FontWeight.w600),
      ),
      Text(
        'JK2012-XB',
        style: TextStyle(color: Colors.black54, fontSize: 12.0),
      ),
    ],
  );
}

Widget avatarMore() {
  return IconButton(
    icon: Icon(Icons.arrow_right),
    tooltip: 'Know More',
    iconSize: 35.0,
    color: Colors.white,
    onPressed: () {},
  );
}
