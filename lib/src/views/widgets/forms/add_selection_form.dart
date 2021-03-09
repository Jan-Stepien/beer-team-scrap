import 'package:beer_team_stable/src/business_logic/blocs/dictionary_bloc.dart';
import 'package:beer_team_stable/src/business_logic/blocs/drink_selection_bloc.dart';
import 'package:beer_team_stable/src/business_logic/models/drink_model.dart';
import 'package:beer_team_stable/src/business_logic/services/database_helper.dart';
import 'package:beer_team_stable/src/views/widgets/add_drink_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';

class AddSelectionForm extends StatefulWidget {
  @override
  _AddSelectionFormState createState() => _AddSelectionFormState();
}

class _AddSelectionFormState extends State<AddSelectionForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final selectionBloc = Provider.of<DrinkSelectionBloc>(context);
    final dictionaryBloc = Provider.of<DictionaryBloc>(context);
    return Form(
        key: _formKey,
        child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Stack(children: [
              ListView(children: <Widget>[
                drinkNameInput(selectionBloc),
                drinkDescriptionInput(selectionBloc),
                ...drinksOfSelectionList(selectionBloc, dictionaryBloc),
              ]),
              addSelectionButton(selectionBloc)
            ])));
  }

  List<Widget> getWidgetSelectionList(List<Drink> selectionDrinkList) {
    List<Widget> result;
    print(selectionDrinkList);
    if (selectionDrinkList != null) {
      result = selectionDrinkList
          .map((selection) => AddDrinkBubble(drinkName: selection.name))
          .toList()
          .cast<Widget>();
    } else {
      result = [Text('Start by adding drinks!')];
    }
    return result;
  }

  Widget drinkNameInput(DrinkSelectionBloc selectionBloc) {
    return StreamBuilder<String>(
        stream: selectionBloc.selectionName,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: const InputDecoration(
              labelText: 'Drinks selection name',
            ),
            keyboardType: TextInputType.name,
            onChanged: selectionBloc.changeSelectionName,
          );
        });
  }

  Widget drinkDescriptionInput(DrinkSelectionBloc selectionBloc) {
    return StreamBuilder<String>(
        stream: selectionBloc.selectionDescription,
        builder: (context, snapshot) {
          return TextFormField(
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
            keyboardType: TextInputType.name,
            onChanged: selectionBloc.changeSelectionDescription,
          );
        });
  }

  List<Widget> drinksOfSelectionList(
      DrinkSelectionBloc selectionBloc, DictionaryBloc dictionaryBloc) {
    var drinkList = [];
    return [
      Text('Your selection',
          style: TextStyle(
            fontSize: 24,
          )),
      // available configuration for multiple choice
      FutureBuilder(
          initialData: [],
          future: DatabaseHelper.getDrinkList().once(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              drinkList.clear();
              Map<dynamic, dynamic> map = snapshot.data.value;
              List<dynamic> list = map.values.toList();

              return SmartSelect.multiple(
                modalType: S2ModalType.popupDialog,
                modalStyle: S2ModalStyle(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                title: 'Drink choices',
                placeholder: 'None',
                value: ['one', 'two'],
                onChange: (value) => print(value),
                choiceItems: list
                    .map((item) => S2Choice<String>(
                        value: item["name"], title: item["name"]))
                    .toList(),
              );
            }
            return Text('nothing here');
          }),

      // TextButton(
      //     onPressed: () {

      //       // Navigator.push(context,
      //       //     MaterialPageRoute(builder: (context) => AddDrinkScreen()));
      //     },
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [Text('Add drink'), Icon(Icons.add_box)],
      //     )),
      Container(
          height: 150,
          child: StreamBuilder<List<Drink>>(
              stream: selectionBloc.drinkList,
              builder: (context, snapshot) {
                return Wrap(children: getWidgetSelectionList(snapshot.data));
              }))
    ];
  }

  Widget addSelectionButton(DrinkSelectionBloc selectionBloc) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: StreamBuilder<bool>(
            stream: selectionBloc.isDrinkSelectionValid,
            builder: (context, snapshot) {
              return ElevatedButton(
                onPressed: snapshot.hasData && !snapshot.hasError
                    ? selectionBloc.addSelection
                    : null,
                child: Text('Add new selection'),
              );
            }),
      ),
    );
  }
}
