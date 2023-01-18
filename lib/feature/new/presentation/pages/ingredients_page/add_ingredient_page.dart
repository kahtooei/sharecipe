import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/params/category_params.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_status.dart';
import 'package:sharecipe/feature/new/presentation/widgets/ingredient_badge.dart';
import 'package:sharecipe/core/widgets/list_item/ingredient_list_item.dart';

class AddIngredientsPage extends StatefulWidget {
  final CategoryParams category;
  const AddIngredientsPage({super.key, required this.category});

  @override
  State<AddIngredientsPage> createState() => _AddIngredientsPageState();
}

class _AddIngredientsPageState extends State<AddIngredientsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewBlocBloc>(context)
        .add(getIngredientCategoryEvent(categoryID: widget.category.id));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: Text(widget.category.name),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 2),
            child: IngredientBadge(),
          )
        ],
      ),
      body: BlocBuilder<NewBlocBloc, NewBlocState>(
        builder: (context, state) {
          return Visibility(
              visible: state.ingredientStatus.runtimeType !=
                  LoadingIngredientListStatus,
              replacement: const Center(
                child: CircularProgressIndicator(
                  color: Constants.MAIN_COLOR,
                ),
              ),
              child: state.ingredientStatus.runtimeType ==
                      CompleteIngredientListStatus
                  ? Column(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              hintText: "Search Ingredient ...",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(color: Constants.MAIN_COLOR)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(color: Constants.MAIN_COLOR))),
                        ),
                      ),
                      Expanded(
                          child: getIngredients(
                              getIngredientList(
                                  state.ingredientStatus
                                      as CompleteIngredientListStatus,
                                  state.searchText),
                              state.selectedIngredients))
                    ])
                  : Center(
                      child: Image.asset("assets/Images/status-error.png"),
                    ));
        },
      ),
    );
  }

  List<IngredientEntity> getIngredientList(
      CompleteIngredientListStatus completeStatu, String searchText) {
    List<IngredientEntity> filteredList = [];
    for (IngredientEntity ingredient in completeStatu.ingredientList) {
      if (ingredient.name!.contains(searchText)) {
        filteredList.add(ingredient);
      }
    }
    return filteredList;
  }

  Widget getIngredients(List<IngredientEntity> ingredientList,
      List<IngredientEntity> selectedList) {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(
          ingredientList.length,
          (index) => IngredientListItem(
                ingredient: ingredientList[index],
                isSelected: selectedList.contains(ingredientList[index]),
              )),
    );
  }
}
