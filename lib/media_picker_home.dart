import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaPickerHome extends StatefulWidget {
  const MediaPickerHome({super.key});
  @override
  State<MediaPickerHome> createState() => _MediaPickerHomeState();
}

class _MediaPickerHomeState extends State<MediaPickerHome> {
  File? _file;
  final _picker = ImagePicker();

  Future<void> _pick(ImageSource source) async {
    final res = await _picker.pickImage(source: source);
    if (res != null) setState(() => _file = File(res.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 1: Media Picker')),
      body: Center(
        child: Column(
          children: [
            _file == null ? const Text("Chưa chọn ảnh") : Image.file(_file!, height: 300),
            ElevatedButton(onPressed: () => _pick(ImageSource.gallery), child: const Text("Chọn Gallery")),
            ElevatedButton(onPressed: () => _pick(ImageSource.camera), child: const Text("Mở Camera")),
          ],
        ),
      ),
    );
  }
}