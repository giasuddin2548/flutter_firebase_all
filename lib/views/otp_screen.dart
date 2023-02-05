import 'package:emplyee_panel/editor.dart';
import 'package:emplyee_panel/utils.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<OtpScreen> {

  var otpController=TextEditingController();
  var fullNameController=TextEditingController();


  @override
  void initState() {
    fullNameController.text='Gias Uddin Samir';
    otpController.text='123456';
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     // appBar: AppBar(title: const Center(child: Text('Login')),),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children:  [
                    const Text('Verify your account', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    MyTextField(otpController, 'Otp'),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            _login();
                          },
                          child: const Text('Verify OTP')
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    MyUtils.showSnackBar('Account Created Success', context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()), (route) => false);
  }
}
