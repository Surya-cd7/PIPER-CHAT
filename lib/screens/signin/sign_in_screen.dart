import 'package:PiPerChat/screens/signIn/components/body.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_drop_down),
        title: Text("Sign in",),
       backgroundColor: Color(0xffb1f1e21),
        ),
        body: Body(),
        
    );
  }
 }