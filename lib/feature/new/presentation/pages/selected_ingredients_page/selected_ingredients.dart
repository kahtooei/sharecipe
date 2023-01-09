import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/widgets/ingredient_list_item.dart';

class SelectedIngredients extends StatelessWidget {
  const SelectedIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: const Text("Selected Ingredients"),
      ),
      body: BlocBuilder<NewBlocBloc, NewBlocState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width - 50,
                height: 60,
                child: TextField(
                  onChanged: (txt) {
                    BlocProvider.of<NewBlocBloc>(context)
                        .add(searchIngredientEvent(searchText: txt));
                  },
                  decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Constants.MAIN_COLOR,
                      ),
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      hintText: "Search Ingredient ...",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Constants.MAIN_COLOR)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Constants.MAIN_COLOR))),
                ),
              ),
              Expanded(
                  child: getIngredients(getIngredientList(
                      state.selectedIngredients, state.searchText)))
            ]),
          );
        },
      ),
    );
  }

  List<IngredientEntity> getIngredientList(
      List<IngredientEntity> selectedList, String searchText) {
    List<IngredientEntity> filteredList = [];
    for (IngredientEntity ingredient in selectedList) {
      if (ingredient.name!.contains(searchText)) {
        filteredList.add(ingredient);
      }
    }
    return filteredList;
  }

  Widget getIngredients(List<IngredientEntity> ingredientList) {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(
          ingredientList.length,
          (index) => IngredientListItem(
                ingredient: ingredientList[index],
                isSelected: true,
              )),
    );
  }
}
