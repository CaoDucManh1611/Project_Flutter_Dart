import 'package:flutter/material.dart';
// Nhớ kiểm tra tên file của bạn có đúng như dưới này không nhé
import 'media_picker_home.dart';
import 'photo_capture_preview.dart';
import 'video_recorder_playback.dart';
import 'simple_audio_player.dart';

void main() => runApp(const MaterialApp(
    home: MainMenu(),
    debugShowCheckedModeBanner: false
));

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HUIT - Thực hành Buổi 7'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMenuButton(context, "Bài 1: Media Picker", const MediaPickerHome(), Colors.blue),
            const SizedBox(height: 10),
            _buildMenuButton(context, "Bài 2: Capture & Preview", const PhotoCapturePreview(), Colors.green),
            const SizedBox(height: 10),
            _buildMenuButton(context, "Bài 3: Video Playback", const VideoRecorderPlayback(), Colors.purple),
            const SizedBox(height: 10),
            _buildMenuButton(context, "Bài 4: Audio Player", const SimpleAudioPlayer(), Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget screen, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      child: Text(title, style: const TextStyle(fontSize: 18)),
    );
  }
}