import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();

  static final FirestoreService _instance = FirestoreService._();

  factory FirestoreService() {
    return _instance;
  }

  void createFirestoreConnection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
  }
}
