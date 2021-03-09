import 'package:beer_team_stable/src/business_logic/models/drink_model.dart';

class DrinkSelection {
  String selectionName ='';
  String selectionDescription = '';
  List<Drink> drinkList = List.from([]);

  DrinkSelection({
      this.selectionName, this.selectionDescription, this.drinkList});
}
