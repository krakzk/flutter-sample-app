// Flutter code sample for Scaffold

// This example shows a [Scaffold] with a [body] and [FloatingActionButton].
// The [body] is a [Text] placed in a [Center] in order to center the text
// within the [Scaffold]. The [FloatingActionButton] is connected to a
// callback that increments a counter.
//
// ![The Scaffold has a white background with a blue AppBar at the top. A blue FloatingActionButton is positioned at the bottom right corner of the Scaffold.](https://flutter.github.io/assets-for-api-docs/assets/material/scaffold.png)

import 'package:flutter/material.dart';
import 'package:sample/detailsAccept.dart';
import 'package:sample/admin/MainScreen.dart';
void main() => runApp(MainScreen());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: DetailsView(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: Center(child: Text('You have pressed the button $_count times.')),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add)
      ),
    );
  }
}

class DetailsView extends StatefulWidget {
  DetailsView({Key key}) : super(key: key);
  @override
  _DetailsView createState () => _DetailsView();
}

class _DetailsView extends State<DetailsView> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton.icon(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsAccept()));
                }, 
                icon: Icon(
                  Icons.edit
                ), 
                label: Text (
                  'Enter Details'
                )
              ),
             RaisedButton.icon(
               onPressed: () {}, 
               icon: Icon(
                 Icons.details
               ), 
               label: Text(
                 'View Details'
               ),
               color: Colors.red[600],
               )
            ],
          ),
        )
      )
    );
  }
}


