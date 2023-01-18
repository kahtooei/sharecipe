import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/core/widgets/error_view.dart';
import 'package:sharecipe/core/widgets/list_item/ingredient_list_item.dart';
import 'package:sharecipe/core/widgets/loading_view.dart';
import 'package:sharecipe/core/widgets/steps/steps_listview_widget.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_status.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';

class RecipeDetailsPage extends StatefulWidget {
  final int recipeID;
  final String recipeTitle;
  const RecipeDetailsPage(
      {super.key, required this.recipeID, required this.recipeTitle});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBlocBloc>(context)
        .add(GetRecipeDetailsEvent(widget.recipeID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: Text(
          widget.recipeTitle,
          maxLines: 1,
        ),
      ),
      body: BlocBuilder<HomeBlocBloc, HomeBlocState>(
        builder: (context, state) {
          switch (state.recipeDetailsStatus.runtimeType) {
            case LoadingRecipeDetailsStatus:
              return LoadingView();
            case ErrorRecipeDetailsStatus:
              return ErrorView();
            case CompleteRecipeDetailsStatus:
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 2),
                        // height: 150,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: (state.recipeDetailsStatus
                                      as CompleteRecipeDetailsStatus)
                                  .recipe
                                  .cover
                                  .isNotEmpty
                              ? Image.network((state.recipeDetailsStatus
                                      as CompleteRecipeDetailsStatus)
                                  .recipe
                                  .cover)
                              : Image.asset("assets/Images/no-photo.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: getIngredientsListView((state.recipeDetailsStatus
                                as CompleteRecipeDetailsStatus)
                            .recipe
                            .ingredients),
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (state.recipeDetailsStatus
                                    as CompleteRecipeDetailsStatus)
                                .recipe
                                .title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            (state.recipeDetailsStatus
                                    as CompleteRecipeDetailsStatus)
                                .recipe
                                .description,
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
                              steps: (state.recipeDetailsStatus
                                      as CompleteRecipeDetailsStatus)
                                  .recipe
                                  .steps))
                    ],
                  ),
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget getIngredientsListView(List<IngredientEntity> ingredients) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ingredients.length,
      itemBuilder: (context, index) => IngredientListItem(
        ingredient: ingredients[index],
        isActive: false,
      ),
    );
  }
}
