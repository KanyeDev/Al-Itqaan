

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<List<String>> getAnnouncementImages() {
    return _firestore.collection('announcement').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc['image'] as String).toList();
    });
  }


}