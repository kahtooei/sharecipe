import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/core/widgets/error_view.dart';
import 'package:sharecipe/core/widgets/loading_view.dart';
import 'package:sharecipe/core/widgets/steps/steps_listview_widget.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_status.dart';
import 'package:sharecipe/feature/new/presentation/pages/create_step_page/create_step_page.dart';
import 'package:sharecipe/feature/new/presentation/pages/final_page/final_page.dart';
import 'package:sharecipe/feature/new/presentation/pages/steps_page/steps_list_item.dart';

class StepsRecipePage extends StatefulWidget {
  const StepsRecipePage({super.key});

  @override
  State<StepsRecipePage> createState() => _StepsRecipePageState();
}

class _StepsRecipePageState extends State<StepsRecipePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewBlocBloc>(context).add(getFunctionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: const Text("Create Recipe Steps"),
        actions: [
          BlocBuilder<NewBlocBloc, NewBlocState>(
            builder: (context, state) => Visibility(
                visible: state.steps.isNotEmpty,
                child: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FinalNewRecipePage(),
                        ));
                  },
                )),
          )
        ],
      ),
      body: BlocBuilder<NewBlocBloc, NewBlocState>(
        builder: (context, state) {
          switch (state.functionsStatus.runtimeType) {
            case LoadingFunctionsStatus:
              return const LoadingView();
            case ErrorFunctionsStatus:
              return const ErrorView();
            case CompleteFunctionsStatus:
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        top: 5,
                        child: SafeArea(
                          child: Container(
                            height: MediaQuery.of(context).size.height -
                                kToolbarHeight -
                                20,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Visibility(
                              visible: state.steps.isNotEmpty,
                              replacement: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 100),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.no_food_sharp,
                                        color: Colors.grey,
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Empty Steps ...",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 25),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              child: StepsListViewWidget(
                                steps: state.steps,
                                isTemp: true,
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      bottom: 20,
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<NewBlocBloc>(context)
                                  .add(emptyCurrentStepData());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateStepPage(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Constants.MAIN_COLOR,
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                Text(
                                  "Add New Step",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
