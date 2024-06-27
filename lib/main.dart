import 'package:bloc_blog/data/models/res/login_res_model.dart';
import 'package:bloc_blog/data/models/res/login_token.dart';
import 'package:bloc_blog/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<LoginTokenRes>(LoginTokenRes());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoMainRouter,
    );
  }
}
