import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoRecorderPlayback extends StatefulWidget {
  const VideoRecorderPlayback({super.key});
  @override
  State<VideoRecorderPlayback> createState() => _VideoRecorderPlaybackState();
}

class _VideoRecorderPlaybackState extends State<VideoRecorderPlayback> {
  VideoPlayerController? _controller;
  final _picker = ImagePicker();

  Future<void> _record() async {
    final res = await _picker.pickVideo(source: ImageSource.camera);
    if (res != null) {
      _controller = VideoPlayerController.file(File(res.path))..initialize().then((_) => setState(() => _controller!.play()));
    }
  }

  @override
  void dispose() { _controller?.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 3: Video Playback')),
      body: Center(
        child: Column(
          children: [
            if (_controller != null && _controller!.value.isInitialized)
              AspectRatio(aspectRatio: _controller!.value.aspectRatio, child: VideoPlayer(_controller!)),
            ElevatedButton(onPressed: _record, child: const Text("Quay Video")),
          ],
        ),
      ),
    );
  }
}