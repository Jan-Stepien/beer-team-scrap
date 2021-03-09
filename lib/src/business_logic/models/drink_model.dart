import 'package:firebase_database/firebase_database.dart';

class Drink {
  String _name;
  String _description;
  String _noOfVotes;
  String _overallRating;
  String _appearanceRating;
  String _smellRating;
  String _tasteRating;
  

  Drink(this._name, this._description, this._noOfVotes, this._overallRating, this._appearanceRating, this._smellRating, this._tasteRating);

  String get name => _name;
  String get description => _description;
  String get noOfVotes => _noOfVotes;
  String get overallRating => _overallRating;
  String get appearanceRating => _appearanceRating;
  String get smellRating => _smellRating;
  String get tasteRating => _tasteRating;

  Drink.fromSnapshot(DataSnapshot snapshot) {
    _name = snapshot.value['name'];
    _description = snapshot.value['description'];
    _noOfVotes = snapshot.value['noOfVotes'];
    _overallRating = snapshot.value['overallRating'];
    _appearanceRating = snapshot.value['appearanceRating'];
    _smellRating = snapshot.value['smellRating'];
    _tasteRating = snapshot.value['tasteRating'];
  }

  Drink.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _description = json['description'],
        _noOfVotes = json['noOfVotes'],
        _overallRating = json['overallRating'],
        _appearanceRating = json['appearanceRating'],
        _smellRating = json['smellRating'],
        _tasteRating = json['tasteRating'];
}
