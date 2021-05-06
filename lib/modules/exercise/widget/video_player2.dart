import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yoga/constants/app_color.dart';

import '../../../constants/app_path.dart';

class VideoPlayerDemo extends StatefulWidget {
  @override
  _VideoPlayerDemoState createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
  VideoPlayerController _videoPlayerController;

  _videoPlayerSetting() async {
    final _vdController =
        VideoPlayerController.asset(AppPath.toAssetsVideo + "boat.mp4")
          ..initialize().then((value) {
            setState(() {});
          });
    _vdController.setLooping(true);
    _vdController.play();

    final old = _videoPlayerController;
    _videoPlayerController = _vdController;

    if (old != null) {
      await old.dispose();
      print("____ old ctrler pause ${old.dataSource}");
    }

    print("new : ${_vdController.dataSource}");
    print("change video");

    print("now: ${_videoPlayerController.dataSource}");
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerSetting();
    print("runnnnnnnnnnnnnnnnnnnnn");
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    print("end");
  }

  @override
  Widget build(BuildContext context) {
    // _videoPlayerSetting();
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: 4 / 3,
              child: VideoPlayer(_videoPlayerController),
            )
          : Center(
              child: Text(
                "No video to show",
                style: TextStyle(
                    color: AppColor.grayBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "GT"),
              ),
            ),
    );
  }
}
