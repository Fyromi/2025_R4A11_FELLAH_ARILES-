import 'package:demineur/widget/MapButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/GameViewModel.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameViewModel()..generateMap(10, 10, 20),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Démineur'),
        ),
        body: Center(
          child: Consumer<GameViewModel>(
            builder: (context, viewModel, child) {
              return Table(
                border: TableBorder.all(color: Colors.black),
                children: List.generate(viewModel.nbLine, (x) {
                  return TableRow(
                    children: List.generate(viewModel.nbCol, (y) {
                      return MapButton(
                        x: x,
                        y: y,
                        viewModel: viewModel,
                      );
                    }),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}