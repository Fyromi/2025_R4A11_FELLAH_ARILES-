import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1/viewmodels/CounterViewModel.dart';
import 'package:tp1/views/HomeView.dart';
import 'package:tp1/views/Page2View.dart';

import 'core/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterViewModel(),
        child: MaterialApp(
            title: title,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              useMaterial3: true,
            ),
            initialRoute: '/mainPage',
            routes: {
              '/secondPage': (context) => Page2View(),
              '/mainPage': (context) => HomeView(),
            }
        )
    );
  }
}