import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';

class StepsRecipePage extends StatefulWidget {
  const StepsRecipePage({super.key});

  @override
  State<StepsRecipePage> createState() => _StepsRecipePageState();
}

class _StepsRecipePageState extends State<StepsRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: Text("Create Recipe Steps"),
      ),
      body: BlocBuilder<NewBlocBloc, NewBlocState>(
        builder: (context, state) {
          return Visibility(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 5,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: getStepsListView(),
                      )),
                  Positioned(
                    bottom: 20,
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {},
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
            ),
          );
        },
      ),
    );
  }

  Widget getStepsListView() {
    return BlocBuilder<NewBlocBloc, NewBlocState>(
      builder: (context, state) => ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Text("Index : $index");
        },
      ),
    );
  }
}
