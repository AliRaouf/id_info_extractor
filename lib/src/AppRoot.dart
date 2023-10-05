import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/id/id_cubit.dart';
import '../screens/HomeScreen.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IdCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    );
  }
}