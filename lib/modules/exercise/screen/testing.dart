import 'package:flutter/material.dart';
import '../widget/video_player.dart';

class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: ExerciseVideoPlayer(videoName: "boat"),
    );
  }
}
