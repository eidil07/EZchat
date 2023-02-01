import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MobilechatFirebaseUser {
  MobilechatFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MobilechatFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MobilechatFirebaseUser> mobilechatFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MobilechatFirebaseUser>(
      (user) {
        currentUser = MobilechatFirebaseUser(user);
        return currentUser!;
      },
    );
