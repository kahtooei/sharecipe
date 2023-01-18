import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';

class IngredientListItem extends StatelessWidget {
  final IngredientEntity ingredient;
  final bool isSelected;
  final bool isActive;
  const IngredientListItem(
      {super.key,
      required this.ingredient,
      this.isSelected = false,
      this.isActive = true});

  @override
  Widget build(BuildContext context) {
    double size = (MediaQuery.of(context).size.width / 4) - 2;
    return SizedBox(
      width: size,
      height: size,
      child: GestureDetector(
        onTap: !isActive
            ? null
            : () {
                if (isSelected) {
                  BlocProvider.of<NewBlocBloc>(context).add(
                      removeFromSelectedIngredientEvent(
                          ingredient: ingredient));
                } else {
                  BlocProvider.of<NewBlocBloc>(context).add(
                      addToSelectedIngredientEvent(ingredient: ingredient));
                }
              },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                    height: size / 1.5,
                    width: size / 1.5,
                    child: Image.network(ingredient.cover!)),
              ),
            ),
            Positioned(bottom: 5, child: Text(ingredient.name!)),
            Visibility(
                visible: isSelected,
                replacement: Container(),
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border:
                          Border.all(color: Constants.MAIN_COLOR, width: 2)),
                  child: const Icon(
                    Icons.check_box,
                    color: Constants.MAIN_COLOR,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
