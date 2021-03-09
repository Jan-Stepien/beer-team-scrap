import 'dart:async';

import 'package:beer_team_stable/src/business_logic/models/drink_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:beer_team_stable/static_strings.dart' as Constants;

class DrinkSelectionBloc {

  final _selectionName = BehaviorSubject<String>();
  final _selectionDescription = BehaviorSubject<String>();
  final _drinkList = BehaviorSubject<List<Drink>>.seeded([]);

  final _drinkName = BehaviorSubject<String>();
  final _drinkDescription = BehaviorSubject<String>();

  Stream<String> get selectionName =>
      _selectionName.stream.transform(_selectionNameValidator);
  Stream<String> get selectionDescription =>
      _selectionDescription.stream.transform(_selectionDescriptionValidator);
  Stream<List<Drink>> get drinkList =>
      _drinkList.stream.transform(_drinkListValidator);
  Stream<bool> get isDrinkSelectionValid => Rx.combineLatest3(
      selectionName, selectionDescription, drinkList, (a, b, c) => true);

  Stream<String> get drinkName =>
      _drinkName.stream.transform(drinkNameValidator);
  Stream<String> get drinkDescription =>
      _drinkDescription.stream.transform(_drinkDescriptionValidator);

  Function(String selectionName) get changeSelectionName =>
      _selectionName.sink.add;
  Function(String selectionName) get changeSelectionDescription =>
      _selectionDescription.sink.add;

  Function(String drinkName) get changeDrinkName => _drinkName.sink.add;
  Function(String drinkDescription) get changeDrinkDescription =>
      _drinkDescription.sink.add;

  final _selectionNameValidator =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (data, sink) => {
                if (data.length < 1)
                  sink.addError(Constants.NAME_REQUIRED_ERROR)
                else
                  sink.add(data)
              });

  final _selectionDescriptionValidator =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (data, sink) => {
                if (data.length < 1)
                  sink.addError(Constants.DESCRIPTION_REQUIRED_ERROR)
                else
                  sink.add(data)
              });
  final _drinkListValidator =
      StreamTransformer<List<Drink>, List<Drink>>.fromHandlers(
          handleData: (data, sink) => {
                if (data.length < 1)
                  sink.addError(Constants.DRINK_LIST_REQUIRED_ERROR)
                else
                  sink.add(data)
              });
  final drinkNameValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (data, sink) => {
            if (data.length < 1)
              {sink.addError(Constants.NAME_REQUIRED_ERROR)}
            else
              {sink.add(data)}
          });

  final _drinkDescriptionValidator =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (data, sink) => {
                if (data.length < 1)
                  sink.addError(Constants.DESCRIPTION_REQUIRED_ERROR)
                else
                  sink.add(data)
              });

  addDrinkToSelection() {
    var drinkListCopy = (_drinkList.value ?? [])
      ..add(
          Drink(_drinkDescription.value, _drinkName.value, '0', '0', '0', '0', '0'));
    _drinkList.sink.add(drinkListCopy);
    _drinkName.sink.add('');
    print(_drinkList.value.length);
  }

  addSelection() {
    // DatabaseHelper().
    // databaseReference.child('selection').set({'name':'newName'});
    
  }

  dispose() {
    _selectionName.close();
    _selectionDescription.close();
    _drinkName.close();
    _drinkDescription.close();
    _drinkList.close();
  }
}
