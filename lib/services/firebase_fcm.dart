
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


class FirebaseFCM{
  static Future<void> init() async{
    FirebaseMessaging messaging=FirebaseMessaging.instance;
    var settings=await messaging.requestPermission(
      alert: true,
      announcement: false,
      sound: true,
      provisional: false,
    );
    print('User granted permission: ${settings.authorizationStatus}');

  }
}