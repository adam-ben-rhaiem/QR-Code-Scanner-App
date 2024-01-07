import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/pages/login.dart';
import 'package:flutter_login/pages/scanner.dart';
import 'package:flutter_login/pages/services/auth_service.dart';
import 'package:flutter_login/pages/signup.dart';
import 'package:flutter_login/wrapper.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login/pages/mainpage.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const MyApp());
    
 }
 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create:(_) => AuthService())
      ],
      child: GetMaterialApp(
        initialRoute: '/',
      
    
        routes: {
        '/': (context) =>  Wrapper(),
        '/login': (context) => const Loginform(),
        '/signup': (context) => const Signup(),
        '/scanner': (context) =>  Scanner(),
        '/mainpage': (context) => const MainPage(scannedData: '', scannedPrice: '',),    


      }),
    );
    
    
  }
  
}
