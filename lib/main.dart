import 'package:flutter/material.dart';
import 'package:planify/methods/firebase_core.dart';
import 'package:planify/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseCoreMethods().initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
