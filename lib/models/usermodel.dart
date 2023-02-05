
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
   String? id;
   String fullName;
   String email;
   String phoneNo;
   String password;


   UserModel({this.id, required this.email, required this.fullName, required this.password, required this.phoneNo});

   toJson(){
      return {'email':email, 'fullName':fullName, 'password':password,'phoneNo':phoneNo };
   }

   factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
      final data=documentSnapshot.data()!;

      return UserModel(
          id: documentSnapshot.id,
          email: data['email'],
          fullName: data['fullName'],
          password: data['password'],
          phoneNo: data['phoneNo']);
   }


}