import 'package:flutter/material.dart';
import 'package:tikitoki/config/theme/app_theme.dart';
import 'package:tikitoki/domain/datasource/local_video_datasource_impl.dart';
import 'package:tikitoki/domain/repositories/video_posts_repository._impl.dart';
import 'package:tikitoki/presentation/providers/discover_provider.dart';
import 'package:tikitoki/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(
      videoDatasource: LocalVideoDatasource(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //lazy: false,
          create:
              (_) =>
                  DiscoverProvider(videoPostRepository: videoPostRepository)
                    ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'TikiToki',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
