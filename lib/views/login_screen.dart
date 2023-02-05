import 'package:emplyee_panel/editor.dart';
import 'package:emplyee_panel/utils.dart';
import 'package:emplyee_panel/views/dashboard.dart';
import 'package:flutter/material.dart';

import 'create_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  void initState() {
    emailController.text='unisoftsystemltd@gmail.com';
    passwordController.text='123456';
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children:  [
                  const Text('Login Account', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 30,),
                  MyTextField(emailController, 'Email'),
                  const SizedBox(height: 20,),
                  MyTextField(passwordController, 'Password'),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          _login();
                        },
                        child: const Text('Login')
                    ),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CreateScreen()));
                        }, child: const Text('Create account')),
                        TextButton(onPressed: (){}, child: const Text('Forgot password')),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Dashboard()));
    MyUtils.showSnackBar('Login Success', context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  const Dashboard()), (route) => false);
  }
}
