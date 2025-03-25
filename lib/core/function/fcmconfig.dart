import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
Fcmconfig(){
  FirebaseMessaging.onMessage.listen((message) {
    String? title=message.notification!.title;
    String? body=message.notification!.body;
    Get.snackbar(title!,body!);
  });
}

requestpermissionNotification()async{
  NotificationSettings settings= await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true
  );
}