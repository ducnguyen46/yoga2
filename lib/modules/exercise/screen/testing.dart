import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/modules/exercise/widget/countdown.dart';
import 'package:yoga/modules/exercise/widget/video_player2.dart';

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
