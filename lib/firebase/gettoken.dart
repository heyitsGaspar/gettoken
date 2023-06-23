import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingHelper {
  static FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  static Future<String?> getToken() async {
    String? token;
    try {
      token = await _messaging.getToken();
      print('Token del dispositivo: $token');
    } catch (e) {
      print('Error al obtener el token: $e');
      print("Hola soy yo de nuevo");
    }
    return token;
  }

  static Future<void> requestNotificationPermissions() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permiso para recibir notificaciones concedido');
    } else {
      print('Permiso para recibir notificaciones denegado');
    }
  }
}
