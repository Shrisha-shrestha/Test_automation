import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference usercollection = FirebaseFirestore.instance.collection('Users');
  final CollectionReference prod_collection = FirebaseFirestore.instance.collection('Product_details');


  Future updateusername(String? name) async {
    return await usercollection.doc(uid).set({
      'Name': name,
    });
  }


  Stream<currentusername> get current {
    return usercollection.doc(uid).snapshots().map(_drawerupdater);
  }

  currentusername _drawerupdater(DocumentSnapshot snapshot) {
    return currentusername(
      uid: uid,
      n: snapshot.get('Name'),
    );
  }

}
class currentusername{
  final String? uid;
  final String n;
  currentusername({ this.uid, required this.n});
}

class theUser{
  final String? uid;
  theUser({ this.uid});
}
