import 'package:bloc_cubit_dio_learning/data/models/post_model.dart';
import 'package:bloc_cubit_dio_learning/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_cubit_dio_learning/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Handling'),
      ),
      body: SafeArea(
          child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state is PostErrorState) {
            SnackBar snackBar = SnackBar(content: Text(state.error.toString()));

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return BlocBuilder<PostCubit, PostState>(builder: (context, state) {
            if (state is PostLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PostLoadedState) {
              return buildPostListView(state.posts);
            }

            return Center(
              child: Text("An error occured"),
            );
          });
        },
      )),
    );
  }

  Widget buildPostListView(posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        PostModel post = posts[index];

        return ListTile(
          title: Text(post.title.toString()),
          subtitle: Text(post.body.toString()),
        );
      },
    );
  }
}
