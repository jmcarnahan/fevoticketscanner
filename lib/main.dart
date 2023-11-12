import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fevo Scanner Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fevo Scanner Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isScanned = false;

  void _setIsScanner() {
    setState(() {
      _isScanned = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget scanButton = Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: 16,
        ),
        child: FloatingActionButton(
          onPressed: _setIsScanner,
          backgroundColor: Colors.blue,
          child: const Text(
            'Scan',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ));
    Widget scannedMsg = const Text(
      'Scanned',
      style: TextStyle(color: Colors.white, fontSize: 24),
    );

    return Scaffold(
      body: Center(child: _isScanned ? scannedMsg : scanButton),
      backgroundColor: _isScanned ? Colors.lightGreen : Colors.white,
    );
  }
}
