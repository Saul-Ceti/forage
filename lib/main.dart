import 'package:flutter/material.dart';
import 'package:forage/home_page.dart';
import 'package:forage/providers/forage_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => ForageProvider(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      title: 'Forage App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
      ),
      home: HomePage(),
    );
  }
}