import 'package:PiPerChat/components/default_button.dart';
import 'package:PiPerChat/components/form_error.dart';
import 'package:PiPerChat/screens/Home.dart';
import 'package:PiPerChat/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PiPerChat/components/formFields.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'customSvgIcon.dart';

class SignForm extends StatefulWidget {
   @override
   _SignFormState createState() => _SignFormState();
 }
 
 class _SignFormState extends State<SignForm> {
   String email;
   String password;
   bool remember = false;
   final _formKey = GlobalKey<FormState>();
   final List<String> errors = [];
   @override
   Widget build(BuildContext context) {
     return Form(
       key: _formKey,
       child: Column(
         children: [
           GenericFormField(
             header: "Email",
            
             errors: errors,
             header_value: email,
             setState: this.setState,
             trailing_Svgicon: "assets/icons/Mail.svg"
           ).buildFormField(),
           SizedBox(height: getProportionateScreenHeight(20)),
           GenericFormField(
             
             header: "Password",
             errors: errors,
             header_value: password,
             setState: this.setState,
             trailing_Svgicon: "assets/icons/Lock.svg"
           ).buildFormField(),
           SizedBox(height: getProportionateScreenHeight(20),),
           Row(
             children: [
               /*Checkbox(
                 activeColor: kPrimaryColor,
                 value: remember,
                 onChanged: (value){
                   setState(() {
                     remember = value;
                   });
                 } ),*/
               //Text("Remember me"),
               Spacer(),
               GestureDetector(onTap:()
                 {
                                 Navigator.of(context).push(CupertinoPageRoute(builder: (_)=> ForgotPasswordScreen(
                                 )));
                  },
   
                   child: Text(
                   "Forgot Password",
                   style: TextStyle(color:Colors.grey,decoration: TextDecoration.underline),
                 ),
               )
             ],),
           FormError(errors: errors),
           SizedBox(height: getProportionateScreenHeight(20),),
           
           DefaultButton(text: "Continue",press: (){
             /*if(_formKey.currentState.validate()){
               _formKey.currentState.save();
             }*/
              {
               {
                                 Navigator.of(context).push(CupertinoPageRoute(builder: (_)=> Home(
                                 )));
                  }
             }
           },)
         ],
       ),
     );
   }
 }