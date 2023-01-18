import 'package:flutter/material.dart';
import 'package:sharecipe/core/utils/constants.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: CircularProgressIndicator(color: Constants.MAIN_COLOR),
      ),
    );
  }
}
