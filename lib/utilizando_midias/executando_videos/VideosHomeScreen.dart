import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoHomeScreen extends StatefulWidget {
  const VideoHomeScreen({Key? key}) : super(key: key);

  @override
  State<VideoHomeScreen> createState() => _VideoHomeScreenState();
}

class _VideoHomeScreenState extends State<VideoHomeScreen> {

  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    //executando com URL
    // _videoController = VideoPlayerController.network(
    //     "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4"
    // )..initialize().then((_) {
    //   setState(() {
    //     _videoController.play();
    //   });
    // });

    _videoController = VideoPlayerController.asset(
      "assets/videos/exemplo.mp4"
    )
      ..setLooping(true)
      ..initialize().then((_){
        setState(() {
          //_videoController.play();
        });
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _videoController.value.isInitialized
            ? AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
          child: VideoPlayer(_videoController),
        )
            : const Text("Pressione play")
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow
        ),
        onPressed: (){
          setState(() {
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
          });
        },
      ),
    );
  }
}
