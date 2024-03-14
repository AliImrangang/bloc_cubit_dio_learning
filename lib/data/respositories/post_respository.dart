import 'dart:math';

import 'package:bloc_cubit_dio_learning/data/models/post_model.dart';
import 'package:bloc_cubit_dio_learning/data/respositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {
  Api api = new Api();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMap = response.data;

      return postMap.map((postMap) => PostModel.fromJson(postMap)).toList();
      // log(response.data);
    } catch (ex) {
      throw ex;
    }
  }
}
