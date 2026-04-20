import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math' as math;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MusicPlayerApp(),
  ));
}


class Song {
  final String title;
  final String artist;
  final String assetPath;
  Song({required this.title, required this.artist, required this.assetPath});
}

class MusicPlayerApp extends StatefulWidget {
  const MusicPlayerApp({super.key});

  @override
  State<MusicPlayerApp> createState() => _MusicPlayerAppState();
}

class _MusicPlayerAppState extends State<MusicPlayerApp> with SingleTickerProviderStateMixin {
  final AudioPlayer _player = AudioPlayer();
  late AnimationController _rotationController;

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int currentIndex = 0;


  final List<Song> playlist = [
    Song(title: "song1", artist: "song1", assetPath: "audios/song1.mp3"),
    Song(title: "song2", artist: "song2", assetPath: "audios/song2.mp3"),
    Song(title: "song3", artist: "song3", assetPath: "audios/song3.mp3"),
  ];

  @override
  void initState() {
    super.initState();


    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );


    _player.onDurationChanged.listen((d) => setState(() => duration = d));
    _player.onPositionChanged.listen((p) => setState(() => position = p));
    _player.onPlayerStateChanged.listen((state) {
      setState(() => isPlaying = state == PlayerState.playing);
      if (isPlaying) {
        _rotationController.repeat();
      } else {
        _rotationController.stop();
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    _rotationController.dispose();
    super.dispose();
  }


  void _playPause() async {
    if (isPlaying) {
      await _player.pause();
    } else {

      await _player.play(AssetSource(playlist[currentIndex].assetPath));
    }
  }

  // Hàm chuyển bài
  void _changeSong(int index) async {
    setState(() {
      currentIndex = index;
    });
    await _player.stop();
    await _player.play(AssetSource(playlist[currentIndex].assetPath));
  }

  // Định dạng thời gian 00:00
  String _formatDuration(Duration d) {
    return "${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D033B),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("NOW PLAYING", style: TextStyle(color: Colors.white60, letterSpacing: 2, fontSize: 12)),
            const SizedBox(height: 40),

            AnimatedBuilder(
              animation: _rotationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationController.value * 2 * math.pi,
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white10, width: 10),
                      image: const DecorationImage(
                        image: NetworkImage("https://via.placeholder.com/300"), // Bạn có thể thay bằng ảnh bìa
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            // PHẦN 2: THÔNG TIN BÀI HÁT
            Text(playlist[currentIndex].title, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            Text(playlist[currentIndex].artist, style: const TextStyle(color: Colors.white70, fontSize: 16)),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Slider(
                    activeColor: Colors.pinkAccent,
                    inactiveColor: Colors.white12,
                    min: 0,
                    max: duration.inSeconds.toDouble() > 0 ? duration.inSeconds.toDouble() : 1.0,
                    value: position.inSeconds.toDouble(),
                    onChanged: (val) => _player.seek(Duration(seconds: val.toInt())),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatDuration(position), style: const TextStyle(color: Colors.white54)),
                      Text(_formatDuration(duration), style: const TextStyle(color: Colors.white54)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _changeSong((currentIndex - 1 + playlist.length) % playlist.length),
                  icon: const Icon(Icons.skip_previous, color: Colors.white, size: 45),
                ),
                const SizedBox(width: 25),
                GestureDetector(
                  onTap: _playPause,
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: const BoxDecoration(color: Colors.pinkAccent, shape: BoxShape.circle),
                    child: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 50),
                  ),
                ),
                const SizedBox(width: 25),
                IconButton(
                  onPressed: () => _changeSong((currentIndex + 1) % playlist.length),
                  icon: const Icon(Icons.skip_next, color: Colors.white, size: 45),
                ),
              ],
            ),

            const Spacer(),
            const Icon(Icons.keyboard_arrow_up, color: Colors.white60),
            const Text("PLAYLIST", style: TextStyle(color: Colors.white60, fontSize: 10)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}