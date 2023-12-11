
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRepository{
  final FirebaseFirestore _firestore;
  FirestoreRepository(this._firestore);

  Future<void> addUser({required String uid, required String name, required String email, bool isBlocked= false}) async{
    final doc = await _firestore.collection('users').add({
      'uid': uid,
      'name': name,
      'email': email,
      'isBlocked': isBlocked
    });
    print(doc.id);
  }
  Future<void> update(String uid, {required String name,}) async{
    final doc = await _firestore.collection('users').where('uid',isEqualTo: uid);

    // print(doc.id);
  }

}

final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) {
  return FirestoreRepository(FirebaseFirestore.instance);
});