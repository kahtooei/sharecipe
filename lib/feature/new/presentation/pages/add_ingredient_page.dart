import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/presentation/bloc/new_bloc_bloc.dart';

class AddIngredientsPage extends StatefulWidget {
  final int categoryID;
  final String categoryName;
  const AddIngredientsPage(
      {super.key, required this.categoryID, required this.categoryName});

  @override
  State<AddIngredientsPage> createState() => _AddIngredientsPageState();
}

class _AddIngredientsPageState extends State<AddIngredientsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewBlocBloc>(context)
        .add(getIngredientCategory(categoryID: widget.categoryID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.MAIN_COLOR,
        title: Text(widget.categoryName),
      ),
      body: Column(children: [Text("Search Data")]),
    );
  }
}
