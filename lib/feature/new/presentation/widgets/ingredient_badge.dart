import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/pages/selected_ingredients_page/selected_ingredients.dart';

class IngredientBadge extends StatelessWidget {
  const IngredientBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBlocBloc, NewBlocState>(
      builder: (context, state) {
        return Visibility(
            visible: state.selectedIngredients.isNotEmpty,
            replacement: const IconButton(
              icon: Icon(Icons.add),
              onPressed: null,
            ),
            child: Badge(
              badgeColor: Constants.SECOND_COLOR,
              position: BadgePosition.topEnd(top: 2, end: 2),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                state.selectedIngredients.length.toString(),
                style: const TextStyle(color: Constants.MAIN_COLOR),
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  BlocProvider.of<NewBlocBloc>(context)
                      .add(searchIngredientEvent(searchText: ''));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectedIngredients(),
                      ));
                },
              ),
            ));
      },
    );
  }
}
