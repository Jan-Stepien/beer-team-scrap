import 'package:beer_team_stable/src/views/widgets/forms/add_drink_form.dart';
import 'package:flutter/material.dart';

class AddDrinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.white, Colors.orange[100]],
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Add drink'),
          ),
          body: AddDrinkForm()),
    );
  }
}
