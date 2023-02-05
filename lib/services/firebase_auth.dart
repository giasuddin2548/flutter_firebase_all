
import 'package:firebase_auth/firebase_auth.dart';

class MyFirebaseAuth{

  final _firebaseAuth=FirebaseAuth.instance;


  User get user => _firebaseAuth.currentUser!;

  // STATE PERSISTENCE STREAM
  Stream<User?> get authState => _firebaseAuth.authStateChanges();

  Future<bool> createUserEmailPass(String email, String password)async{
    var status=false;
    try{
       await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).whenComplete(() {
         status=true;
       });
    }on FirebaseAuthException catch(e){
      status=false;
      print("FirebaseAuthException: ${e.code}");
    }

    return status;
  }

  Future<bool> loginUserEmailPass(String email, String password)async{
    var status=false;
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).whenComplete(() {
        status=true;
      });
    }on FirebaseAuthException catch(e){
      status=false;
      print("FirebaseAuthException: ${e.code}");
    }

    return status;
  }

  Future<bool> logout()async{
    var status=false;
    try{
      await _firebaseAuth.signOut().whenComplete(() {
        status=true;
      });
    }on FirebaseAuthException catch(e){
      status=false;
      print("FirebaseAuthException: ${e.code}");
    }

    return status;
  }


  // Future<void> deleteMyAccount()async{
  //   try{
  //     await _firebaseAuth.signOut();
  //   }on FirebaseAuthException catch(e){
  //     print("FirebaseAuthException: ${e.code}");
  //   }
  // }

}