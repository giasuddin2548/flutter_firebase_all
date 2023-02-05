import 'package:emplyee_panel/utils.dart';
import 'package:emplyee_panel/views/login_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Center(child: Text('Dashboard')),
        actions: [
          IconButton(onPressed: (){
            _logout(context);
          }, icon: const Icon(Icons.logout)),
          // IconButton(onPressed: (){
          //  // _newRecord();
          // }, icon: const Icon(Icons.edit)),
          // IconButton(onPressed: (){
          //   _deleteAccount(context);
          // }, icon: const Icon(Icons.delete)),
        ],
      ),
      body: Container(),
    );
  }

  void _logout(BuildContext context)async {
    // await MyFirebaseAuth().logout().then((value){
    MyUtils.showSnackBar('Logout Success', context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()), (route) => false);
    // });

  }

  // void _deleteAccount(BuildContext context) async{
  //   Navigator.pop(context);
  //   await MyFirebaseAuth().delete();
  // }
}
