import 'package:flutter/material.dart';
import 'package:sharecipe/core/params/category_params.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/presentation/widgets/category_widget.dart';

class CategoryIngredients extends StatelessWidget {
  const CategoryIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: const Text("Ingredients Category"),
        actions: [
          // show ingredient count
          IconButton(
            icon: const Icon(Icons.sports_basketball),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: getView(),
        ),
      ),
    );
  }

  Widget getView() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return getCategoryListRow(index);
      },
    );
  }

  Widget getCategoryListRow(int index) {
    List<Widget> rowList = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryWidget(category: getCategory(0)),
            CategoryWidget(category: getCategory(1)),
            CategoryWidget(category: getCategory(2)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryWidget(category: getCategory(3)),
            CategoryWidget(category: getCategory(4)),
            CategoryWidget(category: getCategory(5)),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryWidget(category: getCategory(6)),
            CategoryWidget(category: getCategory(7)),
            CategoryWidget(category: getCategory(8)),
          ],
        ),
      ),
    ];
    return rowList[index];
  }

  CategoryParams getCategory(int index) {
    List<CategoryParams> categoryList = [
      CategoryParams(
          id: 1,
          name: "Eggs, milk products",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-12/egg_milk_dairy_products.jpg?itok=7uHdxeNm"),
      CategoryParams(
          id: 2,
          name: "Fats and oils",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-12/fats_and_oils.jpg?itok=EeGBc045"),
      CategoryParams(
          id: 3,
          name: "Fruits",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-05/fruits.jpg?itok=vRNbYYhu"),
      CategoryParams(
          id: 4,
          name: "Grain, nuts and baking products",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-12/grain_nuts_baking_ingredients.jpg?itok=LzVLrGEE"),
      CategoryParams(
          id: 5,
          name: "Herbs and spices",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-12/herbs_spices.jpg?itok=96irnENf"),
      CategoryParams(
          id: 6,
          name: "Meat, sausages and fish",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-12/meat_fish_sausages.jpg?itok=9dWyg4Un"),
      CategoryParams(
          id: 7,
          name: "Vegetables",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-05/vegetables_0.jpg?itok=oZYplUrG"),
      CategoryParams(
          id: 8,
          name: "Pasta, rice and pulses",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-12/pasta_rice_legumes.jpg?itok=iW7EmXQl"),
      CategoryParams(
          id: 9,
          name: "Others",
          cover:
              "https://www.cookingwithamc.info/sites/default/files/styles/large_480x480/public/ingredient-wiki-category/2019-05/others.png?itok=d73yLs8k")
    ];
    return categoryList[index];
  }
}
