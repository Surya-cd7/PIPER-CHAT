import 'package:PiPerChat/components/no_account_text.dart';
import 'package:PiPerChat/components/social_card.dart';
import 'package:PiPerChat/screens/signIn/components/sign_form.dart';
import 'package:PiPerChat/size_config.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight*0.08,),
                Text(
                  "Welcome",
                  style: TextStyle(
                    
                    fontSize: getProportionateScreenWidth(28)
                  ),
                ),
                Text(
                  "Sign in with your email and password \nor continue with social accounts",
                  textAlign: TextAlign.center,
                
                ),
                SizedBox(height: SizeConfig.screenHeight*0.06,),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight*0.08,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: (){},
                      ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: (){},
                      ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: (){},
                      ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText()
              ],
              ),
          ),
        ),
      ) 
      );
  }
 }