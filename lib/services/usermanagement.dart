import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserManagement {
  storeNewUser(user, context) {
    FirebaseFirestore.instance.collection('/users').
    add({
      'email':user.email,
      'password': user.password
    }).
    then((value) {
      Navigator.of(context).pop();
//      Navigator.of(context).pushReplacementNamed('homepage');
    }).
    catchError((e){
      print(e);
    });
  }
}