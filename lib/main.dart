import 'dart:math';

import 'package:bloc_cubit_dio_learning/data/models/post_model.dart';
import 'package:bloc_cubit_dio_learning/data/respositories/post_respository.dart';
import 'package:bloc_cubit_dio_learning/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_cubit_dio_learning/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // PostRepository postRepository = new PostRepository();
  //
  // List<PostModel> postModels = await postRepository.fetchPosts();
  //
  // print(postModels.toString());
  // //log(postModels.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
