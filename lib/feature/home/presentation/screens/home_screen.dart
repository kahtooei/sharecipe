import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/feature/home/domain/entities/recipe_entity.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:sharecipe/feature/home/presentation/bloc/home_bloc_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBlocBloc>(context).add(HomeFirstLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Start =="),
        const SizedBox(
          height: 20,
        ),
        BlocConsumer<HomeBlocBloc, HomeBlocState>(
          builder: (context, state) {
            return const Text("Bloc Builder");
          },
          listener: (context, state) {
            if (state.status is HomeCompletedStatus) {
              HomeCompletedStatus h = state.status as HomeCompletedStatus;
              for (RecipeEntity r in h.recipes) {
                print("ID Is : ${r.id}");
                print("Title Is : ${r.title}");
                print("Description Is : ${r.description}");
              }
            }
            print("bloc listener ==> ${state.status}");
          },
        ),
      ],
    );
  }
}
