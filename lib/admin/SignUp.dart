import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {

  static const String _title = 'Sign Up';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  SignUpView({Key key}) : super(key: key);
  @override
  _SignUpView createState () => _SignUpView();
}

class _SignUpView extends State<SignUpView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 20),
        child: SignUpForm()
      ),
    );
  }
}


//Creating a custom form for the user Sign Up
class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
   // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  //Initially password is obscure
  bool _obscureText = true;

  String _email = '';
  String _password = '';

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontFamily: 'Galada'
              ),
            ),
            TextFormField(
              autofocus: true,
              validator: (value) {
                if(value.isEmpty) {
                  return 'Please enter your Name';
                }
                return null;
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Email ID',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontFamily: 'Galada'
              ),
            ),
            TextFormField(
              autofocus: true,
              validator: (value) {
                if(value.isEmpty) {
                  return 'Please enter your email Id';
                }
                _email = value;
                return null;
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
             SizedBox(height: 30),
            Text(
              'Password',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontFamily: 'Galada'
              ),
            ),
            TextFormField(
              autofocus: true,
              validator: (value) {
                if(value.length < 8) {
                  return 'Minimum length 8 characters';
                }
                _password = value;
                return null;
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                _signInUser();
              },
              child: Text('Create'),
              ),
          ],
        ),
    );
  }


  void _signInUser() async {
     if(_formKey.currentState.validate()) {
        final FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email, password: _password)
  ).user;
  if (user != null) {
    Scaffold.of(context)
                  .showSnackBar(
                    SnackBar(
                      content: Text('User Signed Up'),)
                  );
  } else {
   Scaffold.of(context)
                  .showSnackBar(
                    SnackBar(
                      content: Text('Sign Up Failed'),)
                  );
  }
     }
  }
}