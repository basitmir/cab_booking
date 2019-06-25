import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreen();
  }
}

class LoginScreen extends State<Login> {
  String _email;
  String _password;
  bool _autoValidate = false;
  
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  Widget _loginEmail() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'EMAIL',
        errorStyle: TextStyle(backgroundColor: Colors.white.withOpacity(0.2),fontWeight: FontWeight.w600),
       
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
           if(value.isEmpty || !RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$').hasMatch(value) ){
             return 'Please enter the valid email';
           }
           return null;
      },
      onSaved: (String value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _loginPassword() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'PASSWORD',
      errorStyle: TextStyle(backgroundColor: Colors.white.withOpacity(0.2),fontWeight: FontWeight.w600),
    
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

           if(value.length<8)
             return 'Password should be 8+ characters long';
           else
           return null;
      },
      onSaved: (String value) {
        setState(() {
          _password = value;
        });
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
            onPressed: _submitLogin,
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

 Widget _forgotPassword(){
   return  Text(
            'Forgot Password ?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          );
 }
  void _submitLogin(){
     if(_formKey.currentState.validate()){ //if validation is true for all
   Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    
    _formKey.currentState.save();
     final Map<String,dynamic> loginDetails ={
       'email': _email,
       'password':_password,
     };
     print(loginDetails);
     Navigator.pushReplacementNamed(context, '/home');
     }else{
        setState(() {
      _autoValidate = true;
    });
     }

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
      body: Container(
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
                key:_formKey,
                autovalidate: _autoValidate,
                child:Column(
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
                  _loginButton(),
                   SizedBox(height: 50.0),
                ],
              ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:bottomNavBar(context),
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

Widget bottomNavBar(context){
  return  Container(
    
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