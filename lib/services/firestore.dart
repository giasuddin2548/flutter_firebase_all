
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emplyee_panel/models/usermodel.dart';

class FirestoreService{
  final _db=FirebaseFirestore.instance;

  Future<void> postSingleUserData(UserModel userModel)async{
    await _db.collection('users').add(userModel.toJson());
  }


}