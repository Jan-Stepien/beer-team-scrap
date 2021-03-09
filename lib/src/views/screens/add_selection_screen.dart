import 'package:beer_team_stable/src/views/widgets/forms/add_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddSelectionScreen extends StatefulWidget {
  @override
  _AddSelectionScreenState createState() => _AddSelectionScreenState();
}

class _AddSelectionScreenState extends State<AddSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.orange[100]],
        )),
        alignment: Alignment.center, 
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                  title: Text(
                    'Add selection',
                    style: TextStyle(fontSize: 24),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  )),
              body: AddSelectionForm(),
            ));
  }
}
