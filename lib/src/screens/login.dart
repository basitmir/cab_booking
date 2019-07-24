// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  final Function authDetails;
  @override
  Login(this.authDetails);
  State<StatefulWidget> createState() {
    return LoginScreen();
  }
}

class LoginScreen extends State<Login> {
  bool _autoValidate = false;
  bool _progressBarActive = false;
  final Map<String, dynamic> _loginDetails = {
    'email': null,
    'password': null,
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _loginEmail() {
    return TextFormField(
      initialValue: 'basit@gmail.com',
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'EMAIL',

        errorStyle: TextStyle(
            backgroundColor: Colors.white.withOpacity(0.2),
            fontWeight: FontWeight.w600),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        filled: true,
        fillColor: Colors.orange.withOpacity(0.4),
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.white,
        ), // icon is 48px widget.
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.go,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
                .hasMatch(value)) {
          return 'Please enter the valid email';
        }
        return null;
      },
      onSaved: (String value) {
        // setState(() {
        _loginDetails['email'] = value;
        // });
      },
    );
  }

  Widget _loginPassword() {
    return TextFormField(
      initialValue: 'basit@gmail.com',
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'PASSWORD',
        errorStyle: TextStyle(
            backgroundColor: Colors.white.withOpacity(0.2),
            fontWeight: FontWeight.w600),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        filled: true,
        fillColor: Colors.orange.withOpacity(0.4),
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.white,
        ), // icon is 48px widget.
      ),
      textInputAction: TextInputAction.go,
      obscureText: true,
      validator: (String value) {
        if (value.length < 8) {
          return 'Password should be 8+ characters long';
        } else
          return null;
      },
      onSaved: (String value) {
        // setState(() {
        _loginDetails['password'] = value;
        // });
      },
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              setState(() {
                _progressBarActive = true;
                _submitLogin();
              });
            },
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset(0.6, 0.8),
                  end: FractionalOffset(0.0, 0.0),
                  colors: <Color>[
                    Colors.orange,
                    Colors.white,
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 9.9, horizontal: 45.0),
              child: const Text(
                'LOGIN',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
          _forgotPassword(),
        ],
      ),
    );
  }

  Widget _forgotPassword() {
    return Text(
      'Forgot Password ?',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    );
  }

  void _submitLogin() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final User user = User(
          userName: '',
          email: _loginDetails['email'],
          password: _loginDetails['password'],
          id: '');

      final Map<String, dynamic> msg =
          await user.login(_loginDetails['email'], _loginDetails['password']);
      if (!msg['error']) {
        widget.authDetails(msg['userName'], msg['email']);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', msg['token']);
        prefs.setInt('id', msg['id']);
        prefs.setString('userName', msg['userName']);
        prefs.setString('email', msg['email']);

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alertDialog(context, msg['message']); //function defination
            });
      }
    } else {
      // setState(() {
      _autoValidate = true;
      // }); 
    }
    setState(() {
      _progressBarActive = false;
    });
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

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/background.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.orange.withOpacity(0.6), BlendMode.dstATop),
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(10.00, 10.00, 10.00, 0.00),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      _loginEmail(),
                      SizedBox(height: 7.0),
                      _loginPassword(),
                      _progressBarActive
                          ? _dataProcessing(context)
                          : _loginButton(),
                      SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

Widget bottomNavBar(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 30.0,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          child: RaisedButton(
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
            child: Container(
              padding: EdgeInsets.only(top: 6.0),
              width: MediaQuery.of(context).size.width,
              height: 30.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset(0.4, 0.8),
                  end: FractionalOffset(0.0, 0.0),
                  colors: <Color>[
                    Color(0xFFFFA726),
                    Colors.white,
                  ],
                ),
              ),
              // padding: EdgeInsets.symmetric(
              // vertical: 9.9, horizontal: 100.0),
              child: Text(
                "Dont't have an account? SIGNUP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget alertDialog(BuildContext context, String message) {
  return AlertDialog(
    backgroundColor: Colors.orange.withOpacity(0.5),
    title: Icon(Icons.sentiment_dissatisfied, size: 60.0),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Oops..',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 35.0)),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        child: Text('OK', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );
}
