import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video1Page extends StatefulWidget {
  const Video1Page({super.key});

  @override
  State<Video1Page> createState() => _Video1PageState();
}

class _Video1PageState extends State<Video1Page> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/vid.see.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildVideoPlayer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        const SizedBox(height: 10),
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          colors: VideoProgressColors(
            playedColor: Colors.orange,
            backgroundColor: Colors.white,
            bufferedColor: Colors.grey,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
        ),
        const SizedBox(height: 10),
        IconButton(
          iconSize: 48,
          icon: Icon(
            _controller.value.isPlaying ? Icons.pause_circle : Icons.play_circle,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D1A8),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_controller.value.isInitialized)
                  buildVideoPlayer()
                else
                  const CircularProgressIndicator(),

                const SizedBox(height: 60),

                // ✅ زر "لقد انتهيت"
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true); // ✅ يرجّع "true" عند الانتهاء
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDCE6C5),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    'لقد انتهيت',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
