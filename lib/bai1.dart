import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MaterialApp(
    home: MediaPickerHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class MediaPickerHome extends StatefulWidget {
  const MediaPickerHome({super.key});

  @override
  _MediaPickerHomeState createState() => _MediaPickerHomeState();
}

class _MediaPickerHomeState extends State<MediaPickerHome> {
  File? _mediaFile;
  VideoPlayerController? _videoController;
  final ImagePicker _picker = ImagePicker();


  Future<void> _requestPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied) {
      await permission.request();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }


  Future<void> _pickMedia(ImageSource source, bool isVideo) async {

    await _requestPermission(isVideo ? Permission.videos : Permission.photos);

    final XFile? pickedFile;
    if (isVideo) {
      pickedFile = await _picker.pickVideo(source: source);
    } else {
      pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 100,
        maxWidth: 1920,
        maxHeight: 1080,
      );
    }

    if (pickedFile != null) {
      _processFile(File(pickedFile.path), isVideo);
    }
  }


  Future<void> _captureMedia(bool isVideo) async {
    await _requestPermission(Permission.camera);
    if (isVideo) await _requestPermission(Permission.microphone);

    final XFile? capturedFile;
    if (isVideo) {
      capturedFile = await _picker.pickVideo(source: ImageSource.camera);
    } else {
      capturedFile = await _picker.pickImage(source: ImageSource.camera);
    }

    if (capturedFile != null) {
      _processFile(File(capturedFile.path), isVideo);
    }
  }


  void _processFile(File file, bool isVideo) {
    setState(() {
      _mediaFile = file;
      if (isVideo || file.path.toLowerCase().endsWith('.mp4')) {
        _videoController?.dispose();
        _videoController = VideoPlayerController.file(_mediaFile!)
          ..initialize().then((_) {
            setState(() {});
            _videoController!.play();
            _videoController!.setLooping(true);
          });
      } else {
        _videoController?.dispose();
        _videoController = null;
      }
    });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Picker Pro'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 350,
                width: double.infinity,
                color: Colors.black12,
                child: _renderPreview(),
              ),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle("Thư viện (Gallery)"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _actionButton(Icons.image, "Ảnh", Colors.blue, () => _pickMedia(ImageSource.gallery, false))),
                const SizedBox(width: 10),
                Expanded(child: _actionButton(Icons.movie, "Video", Colors.purple, () => _pickMedia(ImageSource.gallery, true))),
              ],
            ),

            const SizedBox(height: 25),

            _buildSectionTitle("Máy ảnh (Camera)"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _actionButton(Icons.camera_alt, "Chụp ảnh", Colors.orange, () => _captureMedia(false))),
                const SizedBox(width: 10),
                Expanded(child: _actionButton(Icons.videocam, "Quay video", Colors.red, () => _captureMedia(true))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget hiển thị nội dung bên trong khung
  Widget _renderPreview() {
    if (_mediaFile == null) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_upload_outlined, size: 70, color: Colors.grey),
          Text("Chưa chọn tệp nào", style: TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      );
    }

    if (_videoController != null && _videoController!.value.isInitialized) {
      return Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: VideoPlayer(_videoController!),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _videoController!.value.isPlaying ? _videoController!.pause() : _videoController!.play();
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black38,
              child: Icon(
                _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }

    return Image.file(_mediaFile!, fit: BoxFit.cover);
  }

  // Widget tiêu đề mục
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
    );
  }

  // Widget nút bấm chung
  Widget _actionButton(IconData icon, String label, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}