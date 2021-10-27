import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/model/user.dart';

class FirebaseDB {
  static Future<bool> getUserDetails(String uid, BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('users');
    QuerySnapshot querySnapshot = await ref.where('uid', isEqualTo: uid).get();
    List<DocumentSnapshot> ds = querySnapshot.docs;
    if (ds.length == 0) {
      return true;
    } else {
      Globals.user = new User(ds.single['dp'], ds.single['name'], uid,
          ds.single['email'],ds.single['favorite_sport'],ds.single['favorite_team'],ds.single['position'],ds.single['experience'],ds.single['rating']);
      return false;
    }
  }


  static Future<bool> getData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('users');
    QuerySnapshot querySnapshot = await ref.where('uid', isEqualTo: Globals.uid).get();
    List<DocumentSnapshot> ds = querySnapshot.docs;
      try{
        Globals.user = new User(ds.single['dp'], ds.single['name'], Globals.uid,
            ds.single['email'],ds.single['favorite_sport'],ds.single['favorite_team'],ds.single['position'],ds.single['experience'],ds.single['rating']);
        return false;
      }
      catch(e){
        Globals.user = new User('-','-', Globals.uid,'-','-','-','-','-','-');
        return false;
      }

  }

  static Future<void> createUser(String uid, String email,
      String name, BuildContext context) async {
    print('part2');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('users');
    String dp = 'https://png.pngtree.com/png-vector/20190224/ourlarge/pngtree-vector-avatar-icon-png-image_699747.jpg';
    try{
      await ref.add({
        'name' : name==null?'':name,
        'uid' : uid==null?'':uid,
        'email': email==null?'':email,
        'dp': dp,
        'favorite_sport': '',
        'favorite_team': '',
        'position': '',
        'experience': '',
        'rating': '',
      });
      print('part3');
    }
    catch(e){
      print(e.message);
    }
    print('added success');
  }

  static Future<void> addUserData(String sport, String team, String position,
      String experience, String rating,  BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('users');
    QuerySnapshot querySnapshot = await ref.where('uid', isEqualTo: Globals.uid).get();
    String id = querySnapshot.docs.single.id;
    await ref.doc(id).update({
        'favorite_sport': sport,
        'favorite_team': team,
        'position': position,
        'experience': experience,
        'rating': rating,
      });
  }
}