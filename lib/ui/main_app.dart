import 'package:flutter/material.dart';
import 'package:myapp/ui/tab_layout.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ííŽėė',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

