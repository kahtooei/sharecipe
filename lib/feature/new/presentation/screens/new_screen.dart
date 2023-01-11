import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';
import 'package:sharecipe/feature/new/presentation/screens/new_appBar.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            const NewAppBar(),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: const [
                  Icon(Icons.receipt),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Recipe Title",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                onChanged: (txt) {
                  BlocProvider.of<NewBlocBloc>(context)
                      .add(updateTitleEvent(txt));
                },
                decoration: const InputDecoration(
                  // prefixIcon: Icon(
                  //   Icons.receipt,
                  //   color: Constants.MAIN_COLOR,
                  // ),
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  hintText: "Insert Recipe Title ...",
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
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: const [
                  Icon(Icons.info),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Recipe Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: TextField(
                maxLines: 6,
                onChanged: (txt) {
                  BlocProvider.of<NewBlocBloc>(context)
                      .add(updateDescriptionEvent(txt));
                },
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: "Insert Recipe Description ...",
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
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: const [
                  Icon(Icons.image),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Recipe Cover",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                        // File file = File(result.files.single.path!);
                        // accountImg = result.files.first.bytes!;
                        //Image.memory(accountImg)
                        // String name = result.files.single.name;
                        String path = result.files.single.path!;
                        // String extentin = result.files.single.extension!;
                        BlocProvider.of<NewBlocBloc>(context)
                            .add(updateSelectedImgEvent(path));
                      }
                    },
                    child: BlocBuilder<NewBlocBloc, NewBlocState>(
                      builder: (context, state) => Center(
                        child: Visibility(
                          visible: state.selectedImgPath == '',
                          replacement: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Image.file(File(state.selectedImgPath)),
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
                                "Add Recipe Cover",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
