import 'package:firebase_core/firebase_core.dart';

const firebaseConfig = {
  "apiKey": "AIzaSyDfzkSh1CCG0IoADZh53l38sNTs-08n6gI",
  "authDomain": "fevo-sbx.firebaseapp.com",
  "projectId": "fevo-sbx",
  "storageBucket": "fevo-sbx.appspot.com",
  "messagingSenderId": "492893892762",
  "appId": "1:492893892762:web:593b4b9474fe455c1a2f23",
};

final FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: firebaseConfig['apiKey'] ?? '',
  authDomain: firebaseConfig['authDomain'] ?? '',
  projectId: firebaseConfig['projectId'] ?? '',
  storageBucket: firebaseConfig['storageBucket'],
  messagingSenderId: firebaseConfig['messagingSenderId'] ?? '',
  appId: firebaseConfig['appId'] ?? '',
);
