import 'package:flutter/material.dart';
import 'package:sharecipe/core/widgets/steps/step_listview_item_widget.dart';
import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';

class StepsListViewWidget extends StatelessWidget {
  final List<RecipeStepEntity> steps;
  final bool isTemp;
  const StepsListViewWidget(
      {super.key, required this.steps, this.isTemp = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return StepListViewItem(
          step: steps[index],
          isTemp: isTemp,
        );
      },
    );
  }
}
