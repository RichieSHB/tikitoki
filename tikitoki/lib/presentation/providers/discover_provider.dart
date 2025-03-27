import 'package:flutter/material.dart';
import 'package:tikitoki/domain/entities/video_post.dart';
import 'package:tikitoki/infrastructure/models/local_video_model.dart';
import 'package:tikitoki/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos =
        videoPosts
            .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
            .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    //todo: cargar videos
    notifyListeners();
  }
}
