import 'package:PiPerChat/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Colors.indigo;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(begin: Alignment.topLeft,end:Alignment.bottomRight,colors: [Color(0xFFFFA53E),Color(0xFFFF7643)]);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
            fontSize: getProportionateScreenWidth(28),
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.5,
          );

final RegExp emailValidatorRegExp = RegExp( 
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
  );
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const Map<String,List<String>> possibleErrors = {
  "Email": [kEmailNullError,kInvalidEmailError],
  "Password": [kPassNullError,kShortPassError,kMatchPassError]
};
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords do not match";