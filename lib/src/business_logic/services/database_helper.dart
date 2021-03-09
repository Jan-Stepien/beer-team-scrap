import 'package:firebase_database/firebase_database.dart';

class DatabaseHelper {

  static DatabaseReference getDrinkList() {
    return FirebaseDatabase.instance.reference().child('drinks');
  }
  
  static DatabaseReference getUserSelections() {
    return FirebaseDatabase.instance.reference().child('userSelections/Jasiek');
  }
}
