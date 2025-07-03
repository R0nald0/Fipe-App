import 'package:fipe_app/app/presentation/features/detail/detail_page.dart';
import 'package:fipe_app/app/presentation/features/home/home_page.dart';
import 'package:flutter/material.dart';

class FipeApp extends StatelessWidget {
  const FipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fipe",
      initialRoute: '/',
      routes: {
        "/" : (context) => HomePage(),
        "/detail" : (context) => DetailPage( )
      },
    );
  }
}