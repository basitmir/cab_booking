import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.orange[500],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: StartAppScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (BuildContext context) => Login(),
          '/register': (BuildContext context) => Register(),
        });
  }
}

class StartAppScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Login'),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
            ),
            RaisedButton(
              child: Text('Register'),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/register'),
            ),
          ],
        ),
      ),
    );
  }
}
