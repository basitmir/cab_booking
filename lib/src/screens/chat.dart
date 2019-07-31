import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Chat',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
       
      ),
      body: Center(
        child: Text('Comming Soon'),
      ),
    );
  }
}
