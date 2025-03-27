import 'package:flutter/material.dart';
import 'package:tikitoki/domain/entities/video_post.dart';
import 'package:tikitoki/presentation/widgets/video/fullscreen_player.dart';
import 'package:tikitoki/presentation/widgets/video_player/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
              ),
            ),
            Positioned(
              right: 20,
              bottom: 40,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
    );
  }
}
