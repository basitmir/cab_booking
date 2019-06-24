import 'package:flutter/material.dart';

class DriverList extends StatelessWidget {
  
  final List<Map<String, String>> drivers;
  final List<int> stars = [1, 2, 3, 4, 5];
  DriverList(this.drivers);

  Widget _singleListItem(BuildContext context, int index) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
      child: Column(
        children: <Widget>[
          rowContainer(
              drivers[index]['name'], drivers[index]['cabNumber'],index,context),
          Image.asset(
            drivers[index]['image'],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: stars
                .map(
                  (element) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget build(context) {
     return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Drivers',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: 
    
    
    
    ListView.builder(
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

Widget rowContainer(String name, String number,int index, BuildContext context) {
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
        avatarText(name, number),
        Spacer(),
        avatarMore(index, context),
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

Widget avatarText(String name, String number) {
  return Column(
    children: <Widget>[
      Text(
        name,
        style: TextStyle(
            color: Colors.black87, fontSize: 15.0, fontWeight: FontWeight.w600),
      ),
      Text(
        number,
        style: TextStyle(color: Colors.black54, fontSize: 12.0),
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
    onPressed: () => Navigator.pushNamed(context, '/driver/'+ index.toString()),
  );
}
