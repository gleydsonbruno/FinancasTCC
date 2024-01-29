import 'package:definitivo_app_tcc/auth/login.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'GFácil',
    theme: ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white.withAlpha(190),
    ),
    home: const SignInScreen(),
  ));
}

