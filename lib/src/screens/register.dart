import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterScreen();
  }
}

class RegisterScreen extends State<Register> {
  final Map<String, dynamic> _registerDetails = {
    'userName': null,
    'email': null,
    'password': null,
  };
  final TextEditingController _passwordTextController = TextEditingController();
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _progressBarActive = false;
  Widget _userName() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'UserName',
        filled: true,
        errorStyle: TextStyle(
            backgroundColor: Colors.white.withOpacity(0.2),
            fontWeight: FontWeight.w600),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        fillColor: Colors.orange.withOpacity(0.4),
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          Icons.person_add,
          color: Colors.white,
        ), // icon is 48px widget.
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.go,
      validator: (String value) {
        if (value.length < 3 ||
            !RegExp(r'^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$')
                .hasMatch(value)) {
          return 'Please enter valid username';
        } else
          return null;
      },
      onSaved: (String value) {
        // setState(() {
        _registerDetails['userName'] = value;
        // });
      },
    );
  }

  Widget _email() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'EMAIL',
        filled: true,
        fillColor: Colors.orange.withOpacity(0.4),
        errorStyle: TextStyle(
            backgroundColor: Colors.white.withOpacity(0.2),
            fontWeight: FontWeight.w600),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
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
          return 'Please enter valid email';
        } else
          return null;
      },
      onSaved: (String value) {
        // setState(() {
        _registerDetails['email'] = value;
        // });
      },
    );
  }

  Widget _password() {
    return TextFormField(
      controller: _passwordTextController,
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
        _registerDetails['password'] = value;

        // });
      },
    );
  }

  Widget _checkPassword() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'CONFIRM PASSWORD',
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
          Icons.lock,
          color: Colors.white,
        ), // icon is 48px widget.
      ),
      textInputAction: TextInputAction.go,
      obscureText: true,
      validator: (String value) {
        if (value != _passwordTextController.text) {
          return 'Password mismatch';
        } else
          return null;
      },
    );
  }

  Widget _registerButton() {
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

                _register();
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
                'REGISTER',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _register() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final User user = User(
          userName: _registerDetails['userName'],
          email: _registerDetails['email'],
          password: _registerDetails['password'],
          id: '');

      final Map<String, dynamic> msg = await user.register(
          _registerDetails['userName'],
          _registerDetails['email'],
          _registerDetails['password']);

      if (!msg['error']) {
         showDialog(
            context: context,
            builder: (BuildContext context) {
              return alertDialog(context, msg['message'],msg['error']); //function defination
            });
        // Navigator.pushReplacementNamed(context, '/login');
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alertDialog(context, msg['message'],msg['error']); //function defination
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
            margin: EdgeInsets.fromLTRB(10.00, 0.00, 10.00, 10.00),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      _userName(),
                      SizedBox(height: 7.0),
                      _email(),
                      SizedBox(height: 7.0),
                      _password(),
                      SizedBox(height: 7.0),
                      _checkPassword(),
                      // SizedBox(height: 2.0),
                      _progressBarActive
                          ? _dataProcessing(context)
                          : _registerButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavbar(context),
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

Widget bottomNavbar(context) {
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
              Navigator.pushReplacementNamed(context, '/login');
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
                "Already have an account? SIGN IN",
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

Widget alertDialog(BuildContext context, String message,bool error) {
  return AlertDialog(
    backgroundColor: Colors.orange.withOpacity(0.5),
    title:error? Icon(Icons.sentiment_dissatisfied, size: 60.0):
    Icon(Icons.sentiment_very_satisfied, size: 60.0),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(error?'Oops..':'Voila!',
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
        child: Text(error ? 'OK' : 'LOGIN',
            style: TextStyle(color: Colors.white)),
        onPressed: () {
          if (!error) {
            Navigator.pop(context);
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);
          } else {
            Navigator.pop(context);
          }
        },
      ),
    ],
  );
}
