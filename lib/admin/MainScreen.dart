
import 'package:flutter/material.dart';
import 'package:sample/admin/LoginScreen.dart';
import 'package:sample/admin/SignUp.dart';
import 'package:sample/admin/BookList.dart';

class MainScreen extends StatelessWidget {
  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);
  @override
  _LoginView createState () => _LoginView();
}


class _LoginView extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login-bgm.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 300),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'BOOKERY',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 50,
                  fontFamily: 'Galada'
                ),
              ),
              SizedBox(height: 30),
              ButtonAction(0, LoginScreen()),
              SizedBox(height: 15),
              ButtonAction(1, SignUp()),
              SizedBox(height: 15),
              ButtonAction(2, BookList())
            ],
          )
        ),
      ),
    );
  }
}


//Function defined to carry out onPressed
void pressedAction(BuildContext context, Widget route)  {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

//Class created to store & use the data for the Buttons

List<Category> _categories = [
    Category('Log In', Icons.person),
    Category('Sign Up', Icons.supervised_user_circle),
    Category('Read On', Icons.book),
];
class Category {
  String name;
  IconData icon;

  Category(this.name, this.icon);
}

//Class that creates the buttons and navigates to corresponding locations
class ButtonAction extends StatelessWidget {

  final int index;
  final Widget route;

  const ButtonAction(this.index, this.route);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: RaisedButton.icon(
          onPressed: () =>  pressedAction(context, route), 
          icon: Icon((_categories[index].icon)), 
          label: Text(_categories[index].name, style: TextStyle( fontSize: 15, fontFamily: 'Galada'),),
          color: Colors.blue[300],
          )
    );
  }
  
}
