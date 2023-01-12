import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/core/widgets/main_screen.dart';
import 'package:sharecipe/locator.dart';
import 'feature/home/presentation/bloc/home_bloc_bloc.dart';
import 'feature/new/presentation/bloc/new_bloc_bloc.dart';

void main() async {
  await setUp();
  // runApp(MaterialApp(
  //   title: 'Sharecipe',
  //   debugShowCheckedModeBanner: false,
  //   theme: ThemeData(),
  //   home: MultiBlocProvider(
  //     providers: [
  //       BlocProvider<HomeBlocBloc>(create: (_) => getIt<HomeBlocBloc>()),
  //       BlocProvider<NewBlocBloc>(create: (context) => NewBlocBloc()),
  //     ],
  //     child: MainScreen(),
  //   ),
  // ));
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<HomeBlocBloc>(create: (_) => getIt<HomeBlocBloc>()),
        BlocProvider<NewBlocBloc>(create: (_) => getIt<NewBlocBloc>()),
      ],
      child: MaterialApp(
        title: 'Sharecipe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            secondaryHeaderColor: Constants.SECOND_COLOR,
            primaryColor: Constants.MAIN_COLOR,
            focusColor: Constants.MAIN_COLOR),
        home: MainScreen(),
      )));
}
