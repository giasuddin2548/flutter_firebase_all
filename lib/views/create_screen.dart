import 'package:emplyee_panel/editor.dart';
import 'package:emplyee_panel/utils.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  var fullNameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  void initState() {
    emailController.text='unisoftsystemltd@gmail.com';
    fullNameController.text='Gias Uddin Samir';
    passwordController.text='123456';
    phoneController.text='01811913041';
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
                    const Text('Create Account', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    MyTextField(fullNameController, 'FullName'),
                    const SizedBox(height: 20,),
                    MyTextField(emailController, 'Email'),
                    const SizedBox(height: 20,),
                    MyTextField(passwordController, 'Password'),
                    const SizedBox(height: 20,),
                    MyTextField(phoneController, 'Phone No.'),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            _login();
                          },
                          child: const Text('Create Account')
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
                            Navigator.pop(context);
                          }, child: const Text('Have an account')),
                          TextButton(onPressed: (){}, child: const Text('Forgot password')),
                        ],
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
