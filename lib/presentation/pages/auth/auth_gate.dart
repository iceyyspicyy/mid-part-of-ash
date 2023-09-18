import 'package:animal_shelter_hero_app_ig/presentation/widgets/body_view.dart';
import 'package:animal_shelter_hero_app_ig/presentation/pages/auth/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState(){

    Future.delayed(Duration(seconds: 0), (){
    checkAuthState();
    });
    super.initState();

  }
  void checkAuthState(){
    User? user = _auth.currentUser;
    if(user != null){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
          builder: (
          (context) => BodyView()
          )
          )
          );

    }
    else{
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (
                      (context) => SignUp()
              )
          )
      );

    }



  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),


      ),
    );
  }
}

