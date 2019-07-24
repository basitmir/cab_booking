import 'package:flutter/material.dart';

class MyTrips extends StatelessWidget {
  final List drivers;
  // final List<int> stars = [1, 2, 3, 4, 5];
  MyTrips(this.drivers);

  Widget _singleListItem(BuildContext context, int index) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
      child: Column(
        children: <Widget>[
          rowContainer(drivers[index]['userName'], drivers[index]['cabNumber'],
              'assets/profile.png', index, context),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            // Icon(Icons.check_circle,color: Colors.green,),
            //  Icon(Icons.sync,color: Colors.orangeAccent),
            statusChip(Icons.check_circle, Colors.green, 'Completed'),
          ]),
        ],
      ),
    );
  }

  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'My Trips',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: ListView.builder(
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
      ),
    );
  }
}

Widget rowContainer(
    String name, String number, String image, int index, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.centerLeft,
          colors: [Colors.orange[400], Colors.white]),
    ),
    margin: EdgeInsets.fromLTRB(6.0, 4.0, 0.0, 1.0),
    child: ExpansionTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatar(image),
          Container(margin: EdgeInsets.only(left: 10.00)),
          avatarText(name, number),
          Spacer(),
          // avatarMore(index, context),
        ],
      ),
      children: <Widget>[
        dataChips('ORIGIN : ', 'This is the', Icons.trip_origin),
        dataChips('DESTINATION : ', 'drivers[index]', Icons.place),
        dataChips('CONTACT : ', '9858536852', Icons.contact_phone),
        dataChips('NAME : ', 'drivers[index]', Icons.person),
        dataChips('DATE : ', 'drivers[index]', Icons.date_range),
        dataChips('TIME : ', 'drivers[index]', Icons.timer),
      ],
    ),
  );
}

Widget avatar(String image) {
  return CircleAvatar(
    radius: 30.0,
    // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
    backgroundImage: AssetImage(image),
    backgroundColor: Colors.black12,
    // child: Text(
    //   'Test',
    //   style: TextStyle(color: Colors.white, fontSize: 12.0),
    // ),
  );
}

Widget avatarText(String name, String number) {
  return Column(
    children: <Widget>[
      Text(
        name.toUpperCase(),
        style: TextStyle(
            color: Colors.orange, fontSize: 15.0, fontWeight: FontWeight.w600),
      ),
      Text(
        number,
        style: TextStyle(color: Colors.orange[400], fontSize: 12.0),
      ),
    ],
  );
}

Widget avatarMore(int index, BuildContext context) {
  return IconButton(
    icon: Icon(Icons.arrow_right),
    tooltip: 'Know More',
    iconSize: 35.0,
    color: Colors.white,
    onPressed: () =>
        Navigator.pushNamed(context, '/driver/' + index.toString()),
  );
}

Widget dataChips(String label, String data, dynamic icon) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.8),
          end: FractionalOffset(0.0, 0.4),
          colors: [Colors.white, Colors.orange[100]]),
    ),
    padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Chip(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          avatar: Icon(
            icon,
            color: Colors.orange,
          ),
          label: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange)),
                TextSpan(
                  text: data,
                  style: TextStyle(color: Colors.orange[400]),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget statusChip(dynamic icon, dynamic color, String text) {
  return Chip(
      padding: EdgeInsets.all(0.0),
        backgroundColor: Colors.white,
        avatar: Icon(
          icon,
          color: color,
        ),
        label: Text(
          text,
          style: TextStyle(color: color,fontWeight: FontWeight.bold),
        ),
  );
}
