import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/pages/category_ingredients.dart';

class NewAppBar extends StatelessWidget {
  const NewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
          color: Constants.MAIN_COLOR,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            "New Recipe",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Positioned(
              right: 10,
              child: BlocBuilder<NewBlocBloc, NewBlocState>(
                builder: (context, state) => Visibility(
                  visible: state.title != "",
                  replacement: const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.not_interested,
                        color: Colors.white,
                      )),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CategoryIngredients()));
                      },
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                ),
              )),
          Positioned(
              left: 10,
              child: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
