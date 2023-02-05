
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emplyee_panel/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<List<UserModel>> getAllUser()async{
    List<UserModel> dataList=[];
    try{
      final data=await _db.collection('users').get();
      final myData=data.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      print('DDDDD: ${myData.length}');
      dataList=myData;
    } on FirebaseException catch (e){

      print(e);
    }

    return dataList;
  }


}