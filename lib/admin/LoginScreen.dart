import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/admin/BookList.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In'
        ),
      ),
      body: LoginForm()
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          Text(
            'Email'
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5, 20, 5),
            child: TextFormField(
              validator: (value) {
                if(value.isEmpty) {
                  return 'Please enter your emailId';
                }
                else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                  return 'Please enter valid emailId';
                }
                _email = value;
                return null;
              },
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Password'
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5, 20, 5),
            child: TextFormField(
              validator: (value) {
                if(value.isEmpty) {
                  return 'Please enter your Password';
                }
                _password = value;
                return null;
              },
            ),
          ),
          RaisedButton(
            child: Text(
              'Submit'
            ),
            onPressed:  () {
              _validateLoginInput(context);
            },
          ),
        ],
      ),
      
    );
  }

  void _validateLoginInput(BuildContext context) async {
      final FormState form = _formKey.currentState;
      FirebaseUser user;
      if (_formKey.currentState.validate()) {
        try {
           user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
           
        } catch(e){

        }
        finally{
                               if (user != null) {
              Scaffold.of(context)
                            .showSnackBar(
                              SnackBar(
                                content: Text('Logged IN'),)
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BookList()));
            } else {
            Scaffold.of(context)
                            .showSnackBar(
                              SnackBar(
                                content: Text('User Not Found'),)
                            );
            }
        }
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

}


