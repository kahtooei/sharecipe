import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/params/category_params.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/widgets/ingredient_list_item.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: Text(widget.category.name),
      ),
      body: BlocBuilder<NewBlocBloc, NewBlocState>(
        builder: (context, state) {
          return Visibility(
              visible: state.ingredientsList.isNotEmpty,
              replacement: const Center(
                child: CircularProgressIndicator(
                  color: Constants.MAIN_COLOR,
                ),
              ),
              child: Column(children: [
                const Text("Search Data"),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: (state.ingredientsList.length / 4).round() + 1,
                //     itemBuilder: (context, index) {
                //       return SizedBox(
                //         width: MediaQuery.of(context).size.width,
                //         height: 30,
                //         child: Center(
                //           child: Text(
                //               "ID: ${state.ingredientsList[index].id} , Name: ${state.ingredientsList[index].name} "),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                Expanded(
                    child: getIngredients(
                        state.ingredientsList, state.selectedIngredients))
              ]));
        },
      ),
    );
  }

  Widget getIngredients(List<IngredientEntity> ingredientList,
      List<IngredientEntity> selectedList) {
    print("ReBuild...");
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
