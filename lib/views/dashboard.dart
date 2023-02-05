import 'package:emplyee_panel/utils.dart';
import 'package:emplyee_panel/views/login_screen.dart';
import 'package:flutter/material.dart';

import '../models/usermodel.dart';
import '../services/firebase_auth.dart';
import '../services/firestore.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<UserModel> list=[];

  @override
  void initState() {
    _getFirebaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Center(child: Text('Dashboard')),
        actions: [
          IconButton(onPressed: (){
            _logout();
          }, icon: const Icon(Icons.logout)),
          // IconButton(onPressed: (){
          //  // _newRecord();
          // }, icon: const Icon(Icons.edit)),
          // IconButton(onPressed: (){
          //   _deleteAccount(context);
          // }, icon: const Icon(Icons.delete)),
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (c, i){
            var d=list[i];
            return ListTile(title: Text(d.fullName),subtitle: Text(d.email),);
          }),
    );
  }


  void _logout() async{
    await MyFirebaseAuth().logout().then((value) async{
      if(value==true){

        MyUtils.showSnackBar('Logout Success', context);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()), (route) => false);
      }else{
        MyUtils.showSnackBar('Failed', context);
      }
    });

  }

  void _getFirebaseData() async{
    list.clear();
    await FirestoreService().getAllUser().then((value) {
      setState(() {
        list=value;
      });
    });
  }
}
