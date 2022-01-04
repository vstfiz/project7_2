import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/model/user.dart';

class FirebaseDB {
  static Future<bool> getUserDetails(String uid, BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('users');
    QuerySnapshot querySnapshot = await ref.where('uid', isEqualTo: Globals.uid).get();
    List<DocumentSnapshot> ds = querySnapshot.docs;
    if (ds.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> getData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('users');
    QuerySnapshot querySnapshot =
        await ref.where('uid', isEqualTo: Globals.uid).get();
    List<DocumentSnapshot> ds = querySnapshot.docs;
    try {
      Globals.user = new User(
          ds.single['dp'] != null ? ds.single['dp'] : '',
          ds.single['name'] != null ? ds.single['name'] : '',
          Globals.uid,
          ds.single['email'] != null ? ds.single['email'] : '',
          ds.single['favorite_sport'] != null
              ? ds.single['favorite_sport']
              : '',
          ds.single['favorite_team'] != null ? ds.single['favorite_team'] : '',
          ds.single['position'] != null ? ds.single['position'] : '',
          ds.single['experience'] != null ? ds.single['experience'] : '',
          ds.single['rating'] != null ? ds.single['rating'] : '');
      return false;
    } catch (e) {
      Globals.user =
          new User('-', '-', Globals.uid, '-', '-', '-', '-', '-', '-');
      return false;
    }
  }

  static Future<void> createUser(BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('users');
    try {
      await ref.add({
        'name': Globals.creationName == null ? '' : Globals.creationName,
        'uid': Globals.creationUid == null ? '' : Globals.creationUid,
        'email': Globals.creationEmail == null ? '' : Globals.creationEmail,
        'dp': Globals.creationDp == null ? '' : Globals.creationDp,
        'favorite_sport': Globals.selectedSport == null ? '' : Globals.selectedSport,
        'favorite_team': Globals.creationTeam == null ? '' : Globals.creationTeam,
        'position': Globals.creationPosition == null ? '' : Globals.creationPosition,
        'gender': Globals.creationGender == null ? '' : Globals.creationGender,
      });
    } catch (e) {
      print(e.message);
    }
    print('added success');
  }

  static Future<void> addUserData(String sport, String team, String position,
      String experience, String rating, BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('users');
    QuerySnapshot querySnapshot =
        await ref.where('uid', isEqualTo: Globals.uid).get();
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
