import 'package:tikitoki/domain/datasource/video_posts_datasource.dart';
import 'package:tikitoki/domain/entities/video_post.dart';
import 'package:tikitoki/infrastructure/models/local_video_model.dart';
import 'package:tikitoki/shared/data/local_video_post.dart';

class LocalVideoDatasource implements VideoPostsDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(Duration(seconds: 2));

    final List<VideoPost> newVideos =
        videoPosts
            .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
            .toList();
    return newVideos;
  }
}
