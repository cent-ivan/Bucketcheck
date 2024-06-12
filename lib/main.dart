import 'package:bucketcheck/Pages/add_bucket.dart';
import 'package:bucketcheck/Pages/home.dart';
import 'package:bucketcheck/ViewModels/bucket_viewModel.dart';
import 'package:bucketcheck/ViewModels/home_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => BucketListViewModel())),
        ChangeNotifierProvider(create: ((context) => CheckListViewModel()))
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
        "/add_bucket":(context) => const AddBucket()
      },
    );
  }
}
