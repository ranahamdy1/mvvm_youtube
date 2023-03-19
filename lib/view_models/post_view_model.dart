import '../models/post_model.dart';

class PostViewModel {
  PostModel? postModel;
  PostViewModel({this.postModel});

  get id {
    return postModel?.id;
  }

  get userId {
    return postModel?.userId;
  }

  get title {
    return postModel?.title;
  }

  get body {
    return postModel?.body;
  }
}
