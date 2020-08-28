import 'package:flutter/material.dart';

void main() => runApp(DetailsAccept());

class DetailsAccept extends StatefulWidget {
  @override
  _DetailsAccept createState() => _DetailsAccept();
  
}

class _DetailsAccept extends State<DetailsAccept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Details Screen"),
        centerTitle: true,
      ),
    );
  }
}