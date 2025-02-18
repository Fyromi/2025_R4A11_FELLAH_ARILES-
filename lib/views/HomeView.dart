import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1/viewmodels/CounterViewModel.dart';
import 'package:tp1/widgets/CustomCounter.dart';

import '../core/constants/constants.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final counterViewModel = context.watch<CounterViewModel>();
    return Consumer<CounterViewModel>(
      builder: (BuildContext context, CounterViewModel name, child) {
        return Scaffold(
          	appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text(title),
          ),
          body: Center(
            child: Column(
              children: [
                CustomCounter(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, '/secondPage');
                  },
                  child: const Text('Aller a la deuxième page'),
                )
              ]
            )
          )
        );
      }
    );
  }
}