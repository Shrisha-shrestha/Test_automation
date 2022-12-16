import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/sign.dart';
import 'home/Homescreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'model/db.dart';
// @dart=2.9

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
  class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return StreamProvider<theUser?>.value(
    value: AuthService().user,
      initialData: null,
      catchError:  (context, e) {
        print('error in LocationModelNormal: ${e.toString()}');
        //or pop a dialogue...whatever.
        return null;
      },
      child: MaterialApp(
  theme: ThemeData(
  primaryColor: Colors.black,
  ),
  debugShowCheckedModeBanner: false,
  title: 'Shopping App',
  home:Home(),
  ),
    );
  }
}