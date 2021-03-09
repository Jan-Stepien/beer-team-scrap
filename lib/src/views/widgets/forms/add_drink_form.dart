import 'package:beer_team_stable/src/business_logic/blocs/drink_selection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:provider/provider.dart';

class AddDrinkForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final selectionBloc = Provider.of<DrinkSelectionBloc>(context);
    return Form(
        key: _formKey,
        child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 50, left: 20, right: 20),
            child: Stack(children: [
              ListView(children: <Widget>[
                drinkNameField(selectionBloc),
                drinkDescriptionField(selectionBloc),
              ]),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: addDrinkButton(context, selectionBloc)),
            ])));
  }

  drinkNameField(DrinkSelectionBloc selectionBloc) {
    return StreamBuilder<String>(
        stream: selectionBloc.drinkName,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: selectionBloc.changeDrinkName,
            decoration: InputDecoration(
                labelText: 'Drink name', errorText: snapshot.error),
            keyboardType: TextInputType.name,
          );
        });
  }

  drinkDescriptionField(DrinkSelectionBloc selectionBloc) {
    return StreamBuilder<String>(
        stream: selectionBloc.drinkDescription,
        builder: (context, snapshot) {
          return TextFormField(
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: 'Description', errorText: snapshot.error),
              keyboardType: TextInputType.name,
              onChanged: selectionBloc.changeDrinkDescription);
        });
  }

  addDrinkButton(context, DrinkSelectionBloc selectionBloc) {
    return SizedBox(
        width: double.infinity,
        child: StreamBuilder2<String, String>(
          streams:
              Tuple2(selectionBloc.drinkName, selectionBloc.drinkDescription),
          builder: (context, snapshot) {
            return ElevatedButton(
              onPressed:
                  !(snapshot.item1.hasError || snapshot.item2.hasError) &&
                          snapshot.item1.hasData &&
                          snapshot.item2.hasData
                      ? () {
                          selectionBloc.addDrinkToSelection();
                          Navigator.pop(context);
                        }
                      : null,
              child: Text('Add new drink'),
            );
          },
        ));
  }
}
