import 'dart:io';

import 'package:emplyee_panel/services/firebase_fcm.dart';
import 'package:emplyee_panel/services/local_notification.dart';
import 'package:emplyee_panel/views/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  NotificationService.showNotification(flnp, 1, '${message.from}', '${message.from}', 'payload');

}

FlutterLocalNotificationsPlugin flnp = FlutterLocalNotificationsPlugin();
final navKey =  GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.init(flnp);
  if(Platform.isIOS){
    print('Checker:__ ${StackTrace.current} Method Called');
    await NotificationService.requestIOSPermissions(flnp);

  }

  // await FirebaseFCM.init();
  ///Start
  FirebaseMessaging messaging=FirebaseMessaging.instance;
  var settings=await messaging.requestPermission(
    alert: true,
    announcement: false,
    sound: true,
    provisional: false,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {

    NotificationService.showNotification(flnp, 1, '${message.from}', '${message.from}', 'payload');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  ///End
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const LoginScreen(),
    );
  }
}
