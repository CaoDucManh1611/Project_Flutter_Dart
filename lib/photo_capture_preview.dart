import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoCapturePreview extends StatefulWidget {
  const PhotoCapturePreview({super.key});
  @override
  State<PhotoCapturePreview> createState() => _PhotoCapturePreviewState();
}

class _PhotoCapturePreviewState extends State<PhotoCapturePreview> {
  File? _image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 2: Capture & Preview')),
      body: Center(
        child: Column(
          children: [
            if (_image != null)
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Image.file(_image!)), appBar: AppBar()))),
                child: Image.file(_image!, height: 200),
              ),
            ElevatedButton(onPressed: () async {
              final res = await _picker.pickImage(source: ImageSource.camera);
              if (res != null) setState(() => _image = File(res.path));
            }, child: const Text("Chụp ảnh & Nhấn để xem to")),
          ],
        ),
      ),
    );
  }
}