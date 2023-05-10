import 'package:flutter/material.dart';
import 'dart:math';

import 'view/screens/add_video.dart';
import 'view/screens/display_screen.dart';
// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [

 /*SearchScreen(),*/
 
  /*Text('Coming Soon In New Updates!'),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,),*/
  /*Text('Home'),*/
  DisplayVideo_Screen(),
  /*Text('Search'),*/
  addVideoScreen(),
  /*Text('Messages'),*/
  Text('Profile'),
];