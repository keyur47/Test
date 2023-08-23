import 'package:cloud_firestore/cloud_firestore.dart';

class AppConstant {
  static final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

}

class FirebaseHelper {
  var docId = FirebaseFirestore.instance.collection('userDetail').doc();

}
