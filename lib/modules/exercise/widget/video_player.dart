import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yoga/constants/app_color.dart';

import '../../../constants/app_path.dart';

class ExerciseVideoPlayer extends StatefulWidget {
  final String videoName;

  ExerciseVideoPlayer({
    Key key,
    @required this.videoName,
  }) : super(key: key);

  @override
  _ExerciseVideoPlayerState createState() => _ExerciseVideoPlayerState();
}

class _ExerciseVideoPlayerState extends State<ExerciseVideoPlayer> {
  VideoPlayerController _videoPlayerController;

  _videoPlayerSetting() async {
    final _vdController = VideoPlayerController.asset(
        AppPath.toAssetsVideo + "${widget.videoName}.mp4")
      ..initialize().then((value) {
        setState(() {});
      });
    _vdController.setLooping(true);
    _vdController.play();

    final old = _videoPlayerController;
    _videoPlayerController = _vdController;

    // if (old != null) {
    //   await old.dispose();
    //   print("____ old ctrler pause ${old.dataSource}");
    // }

    // print("new : ${_vdController.dataSource}");
    // print("change video");

    // print("now: ${_videoPlayerController.dataSource}");
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerSetting();
    print("run");
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    print("end");
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    if (_videoPlayerController.dataSource !=
        (AppPath.toAssetsVideo + widget.videoName + ".mp4")) {
      _videoPlayerController.dispose();
      _videoPlayerSetting();
    }

    // _videoPlayerSetting();
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: 4 / 3,
              child: VideoPlayer(_videoPlayerController),
            )
          : AspectRatio(
              aspectRatio: 4 / 3,
              child: Center(
                child: Text(
                  "No video to show",
                  style: TextStyle(
                      color: AppColor.grayBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "GT"),
                ),
              ),
            ),
    );
  }
}
