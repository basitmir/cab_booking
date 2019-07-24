import 'package:flutter/material.dart';

class DriverDetails extends StatelessWidget {
  final Map<String, dynamic> singleDriver;
  DriverDetails(this.singleDriver);
  static Map<String, dynamic> iconList = {};
  // singleDriver.add('icon':'Icons.Person');
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
            child: ListView(
              children: <Widget>[
                rowContainer(singleDriver['userName'], singleDriver['cabNumber'],
                     'assets/profile.png', singleDriver['rating'], context),

                singleRow(
                  'EMAIL',
                   singleDriver['email'],
                  
                  iconList = {'icon': Icons.email},
                ),
                singleRow(
                  'ADDRESS',
                singleDriver['address'],
                  
                  iconList = {'icon': Icons.person_pin_circle},
                ),
                singleRow(
                  'STATE',
                 singleDriver['state'],
                  
                  iconList = {'icon': Icons.my_location},
                ),
                singleRow(
                  'CITY',
                singleDriver['city'],
                  
                  iconList = {'icon': Icons.location_city},
                ),
                singleRow(
                  'CONTACT',
                singleDriver['phone'],
                  
                  iconList = {'icon': Icons.contact_phone},
                ),

                singleRow(
                  'GENDER',
                   singleDriver['gender'],
                  
                  iconList = {'icon': Icons.assignment_ind},
                ),
                singleRow(
                  'EXPERIENCE',
                singleDriver['experience'].toString(),
                  
                  iconList = {'icon': Icons.verified_user},
                ),
                singleRow(
                  'AGE',
                singleDriver['age'].toString(),
                
                  iconList = {'icon': Icons.perm_identity},
                ),

                singleRow(
                  'VACANCY',
                singleDriver['vacancy'].toString(),
                
                  iconList = {'icon': Icons.event_seat},
                ),

                // Text(singleDriver[0]['name']),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: bookingButton(context),
        ),
      ]),
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
    // child: Text(
    //   'Test',
    //   style: TextStyle(color: Colors.white, fontSize: 12.0),
    // ),
  );
}

Widget avatarText(
  String name,
  String number,
) {
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
                SizedBox(width: 12.0),
                Icon(
                  iconList['icon'],
                  color: Colors.orange,
                  size: 25.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 16.0,
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
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 51.0,
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
      Navigator.pushNamed(context, '/booking');
    },
    shape: StadiumBorder(side: BorderSide(color: Colors.white)),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        gradient: LinearGradient(
          begin: FractionalOffset(0.1, 0.9),
          end: FractionalOffset(0.4, 0.0),
          colors: <Color>[
            Colors.orange,
            Colors.white,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 9.9),
      child: Container(
        padding: EdgeInsets.only(left: 35.00),
        child: Text(
          'BOOK A CAB',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
