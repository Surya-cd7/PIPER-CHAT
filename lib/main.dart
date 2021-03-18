import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/signin/sign_in_screen.dart';

void main()=>runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'PiPer_chat',
       theme: ThemeData(
        primaryColor:Colors.indigo,
        accentColor: Colors.transparent,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white
        ),
        textTheme: TextTheme(
         title: TextStyle(color: Colors.white,fontSize: 16.0),
         button: TextStyle(color:Colors.white) 
        ),
        bottomAppBarColor: Colors.white,
       ),
       home: SignInScreen(),

    );
   }
}