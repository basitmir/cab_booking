import 'package:flutter/material.dart';

class DriverDetails extends StatelessWidget {
  // final String name;
  // final String number;
  final Map<String, String> singleDriver;
  DriverDetails(this.singleDriver);
   Map<String, dynamic> iconList = {'icon': Icons.person};
  // singleDriver.add('icon':'Icons.Person');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
        child: ListView(
          children: <Widget>[
            rowContainer(singleDriver['name'], singleDriver['cabNumber'],
                singleDriver['image'], singleDriver['rating'], context),

            singleRow(
                'EMAIL',
                singleDriver['email'],
                iconList =
                  {'icon': Icons.email},
                ),
            singleRow(
                'ADDRESS',
                singleDriver['address'],
                iconList=
                  {'icon': Icons.my_location},
                ),
            singleRow(
                'CITY',
                singleDriver['city'],
                iconList = 
                  {'icon': Icons.location_city},
                ),
            singleRow(
                'MOBILE',
                singleDriver['mobile'],
                iconList= 
                  {'icon': Icons.contact_phone},
                ),
            singleRow(
                'GENDER',
                singleDriver['gender'],
                iconList= 
                  {'icon': Icons.assignment_ind},
                ),
            singleRow(
                'AGE',
                singleDriver['age'],
                iconList=
                  {'icon': Icons.perm_identity},
                ),

            singleRow(
                'VACANCY',
                singleDriver['vacancy'],
                iconList=
                  {'icon': Icons.event_seat},
                ),

            // Text(singleDriver[0]['name']),
            bookingButton(context),
          ],
        ),
      ),
    );
  }
}

Widget rowContainer(String name, String number, String image, String rating,
    BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.centerLeft,
          colors: [Colors.orange[500], Colors.white]),
    ),
    margin: EdgeInsets.fromLTRB(6.0, 4.0, 0.0, 1.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        avatar(image),
        Container(margin: EdgeInsets.only(left: 10.00)),
        avatarText(name, number),
        Spacer(),
        ratings(rating),
        SizedBox(
          width: 20.0,
        ),
      ],
    ),
  );
}

Widget avatar(String image) {
  return CircleAvatar(
    radius: 30.0,
    //  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
    backgroundImage: AssetImage(image),
    backgroundColor: Colors.black12,
    child: Text(
      'Test',
      style: TextStyle(color: Colors.white, fontSize: 12.0),
    ),
  );
}

Widget avatarText(
  String name,
  String number,
) {
  return Column(
    children: <Widget>[
      Text(
        name,
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

Widget singleRow(String text, String name, Map<String, dynamic> iconList) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 3.0),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.centerLeft,
            colors: [Colors.orange[400], Colors.white]),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Icon(
                  iconList['icon'],
                  color: Colors.orange,
                  size: 25.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    ),
  );
}

Widget ratings(String rating) {
  int rate = int.parse(rating);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      rate,
      (element) => Icon(
        Icons.star,
        color: Colors.yellow,
      ),
    ),
  );
}

Widget bookingButton(BuildContext context) {
  return RaisedButton(
    elevation: 0.00,
    textColor: Colors.white,
    padding: EdgeInsets.all(0.0),
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/booking');
    },
    shape: StadiumBorder(side: BorderSide(color: Colors.white)),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        gradient: LinearGradient(
          // begin: FractionalOffset(0.7, 0.8),
          // end: FractionalOffset(0.0, 0.0),
          colors: <Color>[
            Colors.orange,
            Colors.white,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 9.9),
      child: const Text(
        'BOOK A CAB',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
