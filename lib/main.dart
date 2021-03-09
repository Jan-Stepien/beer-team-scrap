import 'package:beer_team_stable/constants.dart';
import 'package:beer_team_stable/src/business_logic/blocs/dictionary_bloc.dart';
import 'package:beer_team_stable/src/business_logic/blocs/drink_selection_bloc.dart';
import 'package:beer_team_stable/src/views/screens/beer_splash_screen.dart';
import 'package:beer_team_stable/src/views/screens/home_screen%20copy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _intialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _intialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error initializing firebase');
            print(snapshot.error);
            return BeerSplashScreen();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            print('Connected');
            return MultiProvider(
              providers: [
                Provider<DrinkSelectionBloc>(
                    create: (context) => DrinkSelectionBloc()),
                Provider<DictionaryBloc>(create: (context) => DictionaryBloc()),
              ],
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Beer team',
                  theme: ThemeData(
                      fontFamily: 'OpenSans',
                      brightness: Brightness.light,
                      primarySwatch: constPrimaryColor),
                  home: HomeScreenCopy()),
            );
          }
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Beer team',
              theme: ThemeData(
                  fontFamily: 'OpenSans',
                  brightness: Brightness.light,
                  primarySwatch: constPrimaryColor),
              home: BeerSplashScreen());
        });
  }
}
