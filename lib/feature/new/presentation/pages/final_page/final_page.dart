import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/core/widgets/steps/steps_listview_widget.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';

class FinalNewRecipePage extends StatelessWidget {
  const FinalNewRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: const Text("Save Recipe"),
        actions: [
          BlocBuilder<NewBlocBloc, NewBlocState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    RecipeDetailsEntity recipe = RecipeDetailsEntity(
                        id: -1,
                        title: state.title,
                        description: state.description,
                        cover: state.selectedImgPath,
                        steps: state.steps,
                        ingredients: state.selectedIngredients);
                    BlocProvider.of<NewBlocBloc>(context).saveRecipe(recipe);
                  },
                  icon: const Icon(Icons.check));
            },
          )
        ],
      ),
      body: SingleChildScrollView(child: BlocBuilder<NewBlocBloc, NewBlocState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                  // height: 150,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: state.selectedImgPath.isNotEmpty
                        ? Image.file(File(state.selectedImgPath))
                        : Image.asset("assets/Images/no-photo.png"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Icon(Icons.receipt),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Recipe Title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Recipe Description",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      state.description,
                      maxLines: 5,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(FontAwesomeIcons.barsStaggered),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Recipe Steps",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                    height: 300,
                    child: StepsListViewWidget(
                      steps: state.steps,
                      isTemp: true,
                    ))
              ],
            ),
          );
        },
      )),
    );
  }
}
