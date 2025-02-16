import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/GameViewModel.dart';
import '../model/CaseModel.dart';

class MapButton extends StatelessWidget {
  final int x;
  final int y;

  const MapButton({
    super.key,
    required this.x,
    required this.y, required GameViewModel viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, viewModel, child) {
        final CaseModel? currentCase = viewModel.getCase(x, y);
        if (currentCase == null) return SizedBox.shrink();

        return InkWell(
          onTap: () => viewModel.click(x, y),
          onLongPress: () => viewModel.onLongPress(x, y),
          child: Container(
            width: GameViewModel.size,
            height: GameViewModel.size,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: currentCase.hidden ? Colors.blueGrey : Colors.white,
            ),
            child: Center(
              child: currentCase.hasFlag
                  ? Image.asset('assets/images/flag.png',
                      height: GameViewModel.size)
                  : currentCase.hidden
                      ? Image.asset('assets/images/hidden.png',
                          height: GameViewModel.size)
                      : viewModel.getIcon(x, y),
            ),
          ),
        );
      },
    );
  }
}
