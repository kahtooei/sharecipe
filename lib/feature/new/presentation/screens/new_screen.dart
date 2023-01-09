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
      child: Column(
        children: [
          const NewAppBar(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: TextField(
              onChanged: (txt) {
                BlocProvider.of<NewBlocBloc>(context)
                    .add(updateTitleEvent(txt));
              },
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                hintText: "Insert Recipe Title ...",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.MAIN_COLOR)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.MAIN_COLOR)),
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
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
    );
  }
}
