import 'package:flutter/material.dart';
import 'package:sharecipe/core/utils/constants.dart';

class StepsRecipePage extends StatelessWidget {
  const StepsRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: Text("Create Recipe Steps"),
      ),
      body: Center(
        child: Text("Steps ..."),
      ),
    );
  }
}
