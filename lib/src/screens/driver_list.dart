import 'package:flutter/material.dart';
import '../models/driver_model.dart';
import '../../base.dart';

List drivers;

class DriverList extends StatefulWidget {
  final Function driverDetails;
  DriverList(this.driverDetails);
  @override
  State<StatefulWidget> createState() {
    return DriverListDetails();
  }
}

class DriverListDetails extends State<DriverList> {
  bool _progressBarActive = true;
  // final List<int> stars = [1, 2, 3, 4, 5];
  @override
  void initState() {
    setState(() {
      _progressBarActive = true;
      driversList();
    });

    super.initState();
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // _progressBarActive = true;
      driversList();
    });
    return null;
  }

  void driversList() async {
    drivers = await availableDrivers();
    setState(() {
      widget.driverDetails(drivers);
      _progressBarActive = false;
    });
  }

  Widget _singleListItem(BuildContext context, int index) {
    return drivers[index]['cabNumber'] == null
        ? Center(
            child: Text(
            'Something went wrong...',
            style: TextStyle(color: Colors.orange, fontSize: 21.0),
          ))
        : Card(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
            child: Column(
              children: <Widget>[
                rowContainer(
                    drivers[index]['userName'],
                    drivers[index]['cabNumber'],
                    'assets/profile.png',
                    index,
                    context),
                Container(
                  child: FadeInImage(
                    image: NetworkImage(
                      baseUrl + '/images/' + drivers[index]['image'],
                    ),
                    placeholder: AssetImage('assets/car.jpeg'),
                  ),

                ),
                
                currentLocation(drivers[index]['currentLocation']),
                
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
            'Drivers',
            style: TextStyle(color: Colors.white, fontSize: 21.0),
          ),
        ),
        body: _progressBarActive
            ? noDataYet()
            : (drivers.length == 0 ? noDriver() : listBuilder()));
  }

  Widget listBuilder() {
    return RefreshIndicator(
        child: ListView.builder(
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
        onRefresh: refreshList);
  }

  Widget noDataYet() {
    return Center(
      child: _dataProcessing(context),
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
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        avatar(image),
        Container(margin: EdgeInsets.only(left: 10.00)),
        avatarText(name, number),
        Spacer(),
        avatarMore(index, context),
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

Widget _dataProcessing(BuildContext context) {
  return AlertDialog(
    contentPadding: EdgeInsets.all(0.0),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    content: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget noDriver() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.sentiment_very_dissatisfied,
            color: Colors.white, size: 65.0),
        Text(
          'Currently no driver is available \n Try again later...',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget currentLocation(String currentLocation) {
  return Chip(
    backgroundColor: Colors.orange[300],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
    avatar: Icon(
      Icons.location_city,
      color: Colors.orange,
    ),
    label: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Current Location : ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 10.00)),
          TextSpan(
            text: currentLocation,
            style: TextStyle(color: Colors.white, fontSize: 10.00),
          ),
        ],
      ),
    ),
  );
}
