import 'package:flutter/material.dart';
import 'package:myapp/ui/tab_layout.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '테크잇슈',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

