import 'package:flutter/material.dart';

import '../repositorys/posts/post_local.dart';
import '../repositorys/posts/posts_api_repository.dart';
import '../view_models/post_view_model.dart';
import '../view_models/posts_view_model.dart';

class PostsView extends StatelessWidget {
  PostsView({Key? key}) : super(key: key);
  //dependency injection
  var postsViewModel = PostsViewModel(postsRepository: PostsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(postsViewModel.title),
        ),
        body: Center(
            child: FutureBuilder<List<PostViewModel>>(
          future: postsViewModel.fetchAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              var posts = snapshot.data;
              return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(posts![index].title),
                ),
              );
            }
          },
        )));
  }
}
