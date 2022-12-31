import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/widgets/main_screen.dart';
import 'package:sharecipe/locator.dart';

import 'feature/home/presentation/bloc/home_bloc_bloc.dart';

void main() async {
  await setUp();
  runApp(MaterialApp(
    title: 'Sharecipe',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<HomeBlocBloc>())],
      child: MainScreen(),
    ),
  ));
}
