import 'package:bucketcheck/ViewModels/complete_viewModel.dart';
import 'package:bucketcheck/Views/base.dart';
import 'package:bucketcheck/ViewModels/active_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ActiveViewModel())),
        ChangeNotifierProvider(create: ((context) => CompletedViewModel())),
      ],
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'InriaSans'),
          bodySmall: TextStyle(fontFamily: 'InriaSans'),
        )
      ),
      home: const Home(),
      routes: {
        '/home': (context) => const Home()
      },
    );
  }
}
