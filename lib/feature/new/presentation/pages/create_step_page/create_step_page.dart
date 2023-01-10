import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';

class CreateStepPage extends StatelessWidget {
  const CreateStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.BACKGROUND_COLOR,
        title: BlocBuilder<NewBlocBloc, NewBlocState>(
          builder: (context, state) =>
              Text("Create Step ${(state.steps.length) + 1}"),
        ),
      ),
    );
  }
}
