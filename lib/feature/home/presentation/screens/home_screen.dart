import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_status.dart';
import 'package:sharecipe/feature/home/presentation/widgets/error_view.dart';
import 'package:sharecipe/feature/home/presentation/widgets/home_appBar.dart';
import 'package:sharecipe/feature/home/presentation/widgets/loading_view.dart';
import 'package:sharecipe/feature/home/presentation/widgets/recipe_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> recipesList = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBlocBloc>(context).add(HomeFirstLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeAppBar(),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: BlocConsumer<HomeBlocBloc, HomeBlocState>(
            builder: (context, state) {
              switch (state.status.runtimeType) {
                case HomeCompletedStatus:
                  for (RecipeEntity r
                      in (state.status as HomeCompletedStatus).recipes) {
                    recipesList.add(RecipeListItem(recipe: r));
                  }
                  return ListView.builder(
                    itemCount: recipesList.length,
                    itemBuilder: (context, index) {
                      return recipesList[index];
                    },
                  );
                case HomeLoadingStatus:
                  return const LoadingView();
                case HomeErrorStatus:
                  return const ErrorView();
                default:
                  return Container();
              }
            },
            listener: (context, state) {},
          ),
        ),
      ],
    );
  }
}
