
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn(
      scopes: ['email']
    ).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
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