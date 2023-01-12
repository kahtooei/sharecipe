import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/params/step_process_params.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/data/models/step_process_model.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_status.dart';
import 'package:sharecipe/feature/new/presentation/pages/create_step_page/dialogs/widgets/buttons_action_widget.dart';
import 'package:sharecipe/feature/new/presentation/pages/create_step_page/dialogs/widgets/function_dropdown_widget.dart';
import 'package:sharecipe/feature/new/presentation/pages/create_step_page/dialogs/widgets/function_duration_textfield.dart';
import 'package:sharecipe/feature/new/presentation/pages/create_step_page/dialogs/widgets/ingredient_amount_textfield.dart';
import 'package:sharecipe/feature/new/presentation/pages/create_step_page/dialogs/widgets/ingredient_dropdown_widget.dart';

class ProcessDialog {
  final BuildContext context;
  ProcessDialog(this.context);
  ingredientFunctionDialog() {
    String error = "";
    IngredientEntity? selectedIngredient;
    int ingredientAmount = 0;
    ProcessFunctionEntity? selectedFunction;
    int duration = 0;
    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(builder: (stfContext, stfSetState) {
          return Dialog(
            child: BlocBuilder<NewBlocBloc, NewBlocState>(
              builder: (context, state) {
                return Container(
                  width: 250,
                  height: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Create New Process",
                        style: TextStyle(
                            color: Constants.MAIN_COLOR,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IngredientDropDownWidget(
                          onChanged: (value) {
                            selectedIngredient = value!;
                          },
                          ingredientList: state.selectedIngredients),
                      const SizedBox(
                        height: 10,
                      ),
                      IngredientAmountTextField(onChanged: (txt) {
                        if (txt.isNotEmpty) {
                          ingredientAmount = int.parse(txt);
                        } else {
                          ingredientAmount = 0;
                        }
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      FunctionDropDownWidget(
                          functionList:
                              (state.functionsStatus as CompleteFunctionsStatus)
                                  .functionsList,
                          onChanged: (value) {
                            selectedFunction = value!;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      FunctionDurationTextField(onChanged: (txt) {
                        if (txt.isNotEmpty) {
                          duration = int.parse(txt);
                        } else {
                          duration = 0;
                        }
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        error,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ButtonsActionWidget(onPressed: () {
                        if (selectedFunction != null &&
                            selectedIngredient != null &&
                            ingredientAmount > 0) {
                          StepProcessParams process = StepProcessParams(
                              ingredient: selectedIngredient!,
                              function: selectedFunction!,
                              duration: duration,
                              amount: ingredientAmount);
                          BlocProvider.of<NewBlocBloc>(context).add(
                              addCurrentStepProcessEvent(
                                  StepProcessModel.createTemp(process)));
                          Navigator.pop(context);
                        } else {
                          if (selectedIngredient == null) {
                            stfSetState(() {
                              error = "select ingredient";
                            });
                          } else if (ingredientAmount < 1) {
                            stfSetState(() {
                              error = "insert ingredient amount";
                            });
                          } else {
                            stfSetState(() {
                              error = "select function";
                            });
                          }
                        }
                      })
                    ],
                  ),
                );
              },
            ),
          );
        });
      },
    );
  }

  lastStepFunctionDialog() {}

  functionDialog() {}

  customFunctionDialog() {}
}
