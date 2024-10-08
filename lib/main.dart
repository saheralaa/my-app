import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr/cubit/internet_cubit.dart';
import 'package:pr/screen_tow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InternetCubit()..checkConection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocTow(),
      ),
    );
  }
}
