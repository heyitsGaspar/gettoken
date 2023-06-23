import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gettoken/firebase/gettoken.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await FirebaseMessagingHelper.initializeFirebase();
  await Firebase.initializeApp();
  
  // Obtener el token del dispositivo
  String? token = await FirebaseMessagingHelper.getToken();

  // Solicitar permisos de notificación
  await FirebaseMessagingHelper.requestNotificationPermissions();
  
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}