import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/CounterViewModel.dart';

class CustomCounter extends StatelessWidget{
  const CustomCounter({super.key});
  @override
  Widget build(BuildContext context) {
    final counterViewModel = context.watch<CounterViewModel>();
    return(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: counterViewModel.decrementCounter,
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
                Text(
                  '${counterViewModel.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Icon(
                    Icons.favorite,
                    color :  counterViewModel.counter < 0 ? Colors.black : Colors.red,
                    size : 70
                ),
                GestureDetector(
                  onTap: counterViewModel.incrementCounter,
                  child: const Icon(
                      Icons.add),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

}