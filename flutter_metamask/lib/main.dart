import 'package:flutter/material.dart';
import 'package:flutter_metamask/screens/Homepage.dart';

void main() {
  runApp(const MetaMaskApp());
}

class MetaMaskApp extends StatelessWidget {
  const MetaMaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metamask App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MetaMaskHomePage(),
    );
  }
}
