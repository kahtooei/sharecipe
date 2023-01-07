import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/params/category_params.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/presentation/pages/add_ingredient_page.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryParams category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = (width / 3) - 10;
    return SizedBox(
        height: size + 20,
        width: size,
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
                    builder: ((context) => AddIngredientsPage(
                          categoryID: category.id,
                          categoryName: category.name,
                        ))));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(category.cover),
              Text(
                category.name,
                maxLines: 2,
              )
            ],
          ),
        ));
  }
}
