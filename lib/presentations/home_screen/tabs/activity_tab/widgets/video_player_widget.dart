import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:video_player/video_player.dart';


class VideoViewWidget extends StatefulWidget {
  final VideoPlayerController? videoController;

  VideoViewWidget({required this.videoController});

  @override
  _VideoViewWidgetState createState() => _VideoViewWidgetState();
}

class _VideoViewWidgetState extends State<VideoViewWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.videoController != null &&
        widget.videoController!.value.isInitialized) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: AspectRatio(
          aspectRatio: widget.videoController!.value.aspectRatio,
          child: GestureDetector(
            child: _buildVideoPlayer(),
            onTap: () {
              widget.videoController!.value.isPlaying
                  ? widget.videoController?.pause()
                  : widget.videoController?.play();
              setState(() {});
            },
          ),
        ),
      );
    }

    return Center(
      child: SpinKitThreeBounce(color: ColorConstants.white, size: 40.h),
    );
  }

  Widget _buildVideoPlayer() {
    var children = <Widget>[
      VideoPlayer(widget.videoController!),
      VideoProgressIndicator(
        widget.videoController!,
        allowScrubbing: true,
        colors: VideoProgressColors(
            bufferedColor: ColorConstants.yellow, playedColor: ColorConstants.mainColor),
      ),
    ];

    if (!widget.videoController!.value.isPlaying) {
      children.add(
        IgnorePointer(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Constants.spaceVertical(30),
                Container(
                    padding: EdgeInsets.all(25.w),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Icon(Icons.play_arrow_rounded,
                        color: ColorConstants.mainColor, size: 80.w)),
                Constants.spaceVertical(20),
                Text("play video",
                    style: TextStyle(color: Colors.white, fontSize: 48.sp)),
              ],
            ),
          ),
        ),
      );
    }

    return Stack(alignment: Alignment.bottomCenter, children: children);
  }
}
