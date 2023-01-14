import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/params/recipe_step_params.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/data/models/recipe_step_model.dart';
import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';
import 'package:sharecipe/feature/new/domain/entities/step_process_entity.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/pages/create_step_page/dialogs/add_process_dialog.dart';
import 'package:sharecipe/feature/new/presentation/pages/create_step_page/process_list_item.dart';

class CreateStepPage extends StatelessWidget {
  const CreateStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: BlocBuilder<NewBlocBloc, NewBlocState>(
          builder: (context, state) =>
              Text("Create Step ${(state.steps.length) + 1}"),
        ),
        actions: [
          BlocBuilder<NewBlocBloc, NewBlocState>(
            builder: (context, state) => Visibility(
                visible: state.currentStepTitle.isNotEmpty,
                replacement: const Icon(Icons.not_interested),
                child: IconButton(
                  onPressed: () {
                    int sumDuration =
                        getSumDuration(state.currentStepProcessList);
                    RecipeStepParams params = RecipeStepParams(
                        stepNumber: state.steps.length + 1,
                        title: state.currentStepTitle,
                        description: state.currentStepDescription,
                        mediaPath: state.currentStepMedia,
                        processList: state.currentStepProcessList,
                        duration: sumDuration);
                    RecipeStepEntity step = RecipeStepModel.createTemp(params);
                    BlocProvider.of<NewBlocBloc>(context)
                        .add(addNewStepEvent(step));
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.check),
                )),
          )
        ],
      ),
      body: BlocBuilder<NewBlocBloc, NewBlocState>(
        builder: (context, state) => Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Constants.MAIN_COLOR,
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "Step Info",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Constants.MAIN_COLOR,
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: const [
                      Icon(Icons.title_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Step Title",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (txt) {
                      BlocProvider.of<NewBlocBloc>(context)
                          .add(updateCurrentTitleEvent(txt));
                    },
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      hintText: "Insert Step Title ...",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Constants.MAIN_COLOR)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: const [
                      Icon(Icons.info),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Step Description",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  child: TextField(
                    maxLines: 4,
                    onChanged: (txt) {
                      BlocProvider.of<NewBlocBloc>(context)
                          .add(updateCurrentDescriptionEvent(txt));
                    },
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      hintText: "Insert Step Description ...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Constants.MAIN_COLOR)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: const [
                      Icon(Icons.image),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Step Media",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Constants.BACKGROUND_COLOR,
                          foregroundColor: Constants.MAIN_COLOR),
                      onPressed: () async {
                        var result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png', 'jpeg'],
                        );
                        if (result != null) {
                          String path = result.files.single.path!;
                          BlocProvider.of<NewBlocBloc>(context)
                              .add(updateCurrentMediaEvent(path));
                        }
                      },
                      child: Center(
                        child: Visibility(
                          visible: state.currentStepMedia == '',
                          replacement: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Image.file(File(state.currentStepMedia)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 35,
                              ),
                              Text(
                                "Add Step Media",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Constants.MAIN_COLOR,
                    )),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Text(
                        "Step Process",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Constants.MAIN_COLOR,
                    )),
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.MAIN_COLOR,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    // onPressed: () => MenuDialog().getDialog(context),
                    onPressed: () =>
                        ProcessDialog(context).ingredientFunctionDialog(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add Process",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: getProcess(state.currentStepProcessList),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getProcess(List<StepProcessEntity> processList) {
    return ListView.builder(
      itemCount: processList.length,
      itemBuilder: (context, index) {
        return ProcessListItem(process: processList[index]);
      },
    );
  }

  int getSumDuration(List<StepProcessEntity> processList) {
    int sumDuration = 0;
    for (StepProcessEntity process in processList) {
      sumDuration += process.duration;
    }
    return sumDuration;
  }
}
