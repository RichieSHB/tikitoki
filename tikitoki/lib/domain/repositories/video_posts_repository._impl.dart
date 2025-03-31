import 'package:tikitoki/domain/datasource/video_posts_datasource.dart';
import 'package:tikitoki/domain/entities/video_post.dart';
import 'package:tikitoki/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostsDatasource videoDatasource;

  VideoPostsRepositoryImpl({required this.videoDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoDatasource.getTrendingVideosByPage(page);
  }
}
