import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Help',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: helpItems(context),
    );
  }
}

Widget helpItems(BuildContext context) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 3.0),
    child: ListView(
      children: <Widget>[
        rowContainer(context, 'how can i book the cab ?',
            '    FOLLOW THE ABOVE STEPS TO BOOK A CAB :-\n - On home page give the desired details. \n - Select the driver from the available drivers. \n - Fill the given details to book the cab.'),
        rowContainer(
            context,
            'how can i know about the cabs which i have booked ?',
            'Click on the side menu and know about your booked cabs and trips.'),
        rowContainer(context, 'How can i make the payment ?',
            'Currently you have to pay to the driver when the trip is completed. We are going to add online payment soon...'),
        rowContainer(context, 'how can i know about the driver ?',
            'Select the one of the driver in the availabe drivers list after the HOME PAGE to get the details about driver.'),
        rowContainer(context, 'how can i share the app with my friends ?',
            'Click on the side menu and select SPREAD THE WORD option to share the app.'),
        rowContainer(context, 'How can i contact the driver ?',
            'You can contact the driver via his contact number mentioned in the driver details.\n We will soon add the chat feature to chat with the driver.'),
        rowContainer(context, 'how can i rate the driver ?',
            'Ratings cannot be done as of now. We are working on it.Stay tuned...'),
        rowContainer(context, 'I want to know about my offers ?',
            'Click on the side menu and select OFFERS to know about the available offers.'),
        rowContainer(
            context,
            'Is the Application having real time navigation ?',
            'Comming Soon...'),
        rowContainer(context, 'Have any other queries ?',
            'Mail us on admin@admin.com or \nContact us on our HELPLINE 9858536852 \n We will get back to you A.S.A.P'),
      ],
    ),
  );
}

Widget rowContainer(BuildContext context, String question, String answer) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.centerLeft,
          colors: [Colors.orange[400], Colors.white]),
    ),
    margin: EdgeInsets.fromLTRB(6.0, 4.0, 0.0, 1.0),
    child: ExpansionTile(
      leading: Icon(
        Icons.lens,
        color: Colors.orange,
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              question.toUpperCase(),
              style: TextStyle(
                  color: Colors.orange[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 20.00),
              // avatarMore(index, context),
            ),
          ),
        ],
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 0, 6.0, 0),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Text(
            answer,
            style: TextStyle(color: Colors.orange, fontSize: 20.00),
          ),
        ),
      ],
    ),
  );
}
