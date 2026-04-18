import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SimpleAudioPlayer extends StatefulWidget {
  const SimpleAudioPlayer({super.key});
  @override
  State<SimpleAudioPlayer> createState() => _SimpleAudioPlayerState();
}

class _SimpleAudioPlayerState extends State<SimpleAudioPlayer> {
  final _player = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 4: Audio Player')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.music_note, size: 100, color: Colors.orange),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(iconSize: 64, icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () async {
                      if (isPlaying) { await _player.pause(); }
                      else { await _player.play(AssetSource('audios/sample1.mp3')); }
                      setState(() => isPlaying = !isPlaying);
                    }),
                IconButton(iconSize: 64, icon: const Icon(Icons.stop), onPressed: () => _player.stop()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}