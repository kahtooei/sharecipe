import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';
import 'package:sharecipe/feature/home/presentation/pages/recipe_details/recip_details_page.dart';

class RecipeListItem extends StatelessWidget {
  final RecipeEntity recipe;
  const RecipeListItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Constants.MAIN_COLOR,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailsPage(
                    recipeID: recipe.id!, recipeTitle: recipe.title!),
              ));
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              // height: 150,
              width: MediaQuery.of(context).size.width / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  recipe.cover!,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      recipe.title!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Constants.MAIN_COLOR),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      recipe.description!,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      maxLines: 4,
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        const Icon(Icons.insert_comment_sharp),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(recipe.likeCount.toString()),
                        const SizedBox(
                          width: 2,
                        ),
                        const Icon(CupertinoIcons.heart),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
