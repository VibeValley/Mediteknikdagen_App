import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:mtd_app/mainpage/notificationscreen.dart';


Future<void> handleBackgroundMessage(RemoteMessage message) async{
  /* print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}'); */
}

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;


  void handleMessage(RemoteMessage? message){
    if(message == null) return;

    /* navigatorKey.currentState?.pushNamed(NotificationScreen.route,
    arguments: message,
    ); */
  }


  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    //final fCMToken = await _firebaseMessaging.getToken();
    //print('Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage((handleBackgroundMessage));
  }
}