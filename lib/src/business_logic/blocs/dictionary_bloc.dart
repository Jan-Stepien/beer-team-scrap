import 'package:beer_team_stable/src/business_logic/models/drink_model.dart';
import 'package:beer_team_stable/src/business_logic/services/database_helper.dart';
import 'package:rxdart/rxdart.dart';

class DictionaryBloc {
  var drinks;

  final _drinkList = BehaviorSubject<List<Drink>>.seeded([]);

  Stream<List<Drink>> get drinkList => _drinkList.stream;

  // List<Drink> getInitialDrinkList() {
  //   DatabaseHelper.getDrinkList().limitToFirst(10).onValue( ()=>)
  // }
  DictionaryBloc() {
    drinks = DatabaseHelper.getDrinkList()
      .limitToFirst(10)
      .onValue
      .map((item) {print('dictionaryBloc');print('$item');});
  }
  //   print('Dictionary bloc constructor called');

  // DatabaseHelper.getDrinkList().

  //   DatabaseHelper.getDrinkList().then((snapshot) {
  //     List<Drink> drinks = [];
  //     for (Drink drink in snapshot.value) {
  //       print('$drink');
  //       // drinks.add(Drink(
  //       //     drink.name, drink.description, drink.noOfVotes, drink.rating));
  //     }
  //   });
  // }

  //   Map<dynamic, dynamic> values = snapshot.data.value;
  // values.forEach((key, values) {
  //   needs.add(Need.fromSnapshot(values));
  // });
  // snapshot.forEach( )
  // var jsonString =
  //     snapshot.value; // as List).forEach((item) => print(item));

  // Map<dynamic, dynamic> map = snapshot.value;
  // map.forEach((key, value) => print(Drink.fromJson(value)));
  // _drinkList.sink.add(drinks);
  // print(jsonDecode(x));
  // print(jsonDecode(snapshot.value).toString());
  // List<Drink> list =
  //     (jsonDecode(snapshot.value) as List<dynamic>).cast<Drink>();
  // print('${snapshot.value}');

  dispose() {
    _drinkList.close();
  }
}
