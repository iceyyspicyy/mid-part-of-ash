import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../presentation/widgets/body_view.dart';
import 'firestore_service.dart';

class AuthService
{
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreService = FirestoreService();



  Future<void> createUser(Map<String, dynamic>data, context) async {

    var createAt = DateTime.now().millisecond;
    try {
    final credential = await auth.createUserWithEmailAndPassword(
    email: data['email'],
      password: data['password'],
    );

    var userData = {
      "id": credential.user!.uid,
      "create": createAt,
      "bio": "Bio",
      "des": "Using animal shelter hero app",
      "url": "ashYay.com",
      "profileUrl":
      "https://img.freepik.com/free-vector/hand-drawn-korean-drawing-style-character-illustration_23-2149623257.jpg?size=338&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"

    };

    var userDetails = {...data, ...userData};

    await firestoreService.addUser(userDetails);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (
                    (context) => BodyView()
            )
        )
    );
  }
  catch (e) {
    showDialog(
        context: context,
        builder:(BuildContext context){
        return AlertDialog(
          title: Text("Sign Up Failed"),
          content: Text(e.toString()),

      );

    });
  }
}
  Future<void> loginUser(data, context) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (
                      (context) => BodyView()
              )
          )
      );
    }
    catch (e) {
      showDialog(
          context: context,
          builder:(BuildContext context){
            return AlertDialog(
              title: Text("Login Failed"),
              content: Text(e.toString()),

            );

          });
    }
  }
}