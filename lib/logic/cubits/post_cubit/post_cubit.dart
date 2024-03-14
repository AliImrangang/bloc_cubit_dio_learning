import 'package:bloc_cubit_dio_learning/data/models/post_model.dart';
import 'package:bloc_cubit_dio_learning/data/respositories/post_respository.dart';
import 'package:bloc_cubit_dio_learning/logic/cubits/post_cubit/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchpost();
  }

  void fetchpost() async {
    try {
      PostRepository postRepository = new PostRepository();
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } on DioError catch (ex) {
      emit(PostErrorState(ex.message.toString()));
    }
  }
}
