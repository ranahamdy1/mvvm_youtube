import 'package:dio/dio.dart';
import 'package:mvvm2/view_models/post_view_model.dart';

import '../models/post_model.dart';
import '../repositorys/posts/post_repository.dart';
import '../repositorys/posts/posts_api_repository.dart';

class PostsViewModel {
  //final doesn't chandge
  final String title = "all posts";

  PostsRepository? postsRepository;
  PostsViewModel({this.postsRepository});

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostModel> list = await postsRepository!.getAllPosts();
    return list.map((post) => PostViewModel(postModel: post)).toList();
    //PostApi().getAllPosts();
  }
}
