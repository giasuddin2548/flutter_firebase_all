
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emplyee_panel/models/usermodel.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService{
  final _db=FirebaseFirestore.instance;

  Future<bool> postSingleUserData(UserModel userModel)async{
    bool status=false;
    try{
      await _db.collection('users').add(userModel.toJson()).whenComplete((){
        status=true;
      });
    } catch (e){
      status=false;
      print(e);
    }

    return status;
  }


}