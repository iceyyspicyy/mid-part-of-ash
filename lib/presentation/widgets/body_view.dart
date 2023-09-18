import 'package:animal_shelter_hero_app_ig/post_upload.dart';
import 'package:animal_shelter_hero_app_ig/presentation/pages/profile/profile_view.dart';
import 'package:animal_shelter_hero_app_ig/presentation/pages/search/search_view.dart';
import 'package:animal_shelter_hero_app_ig/presentation/pages/upload_post/post_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/home/home_view.dart';
import 'nav_bar.dart';

class BodyView extends StatefulWidget {
  const BodyView({super.key});

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  int currentIndex = 0;
  var pageViewList = [
    HomeView(),
    SearchView(),
    PostView(),
    PostUploadPage(),
    ProfileView(userId: FirebaseAuth.instance.currentUser!.uid,),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
      ),
      body: pageViewList[currentIndex],
    );
  }
}