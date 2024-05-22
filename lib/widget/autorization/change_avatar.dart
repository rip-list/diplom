// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../constant/import_const.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  ImagePickerScreenState createState() => ImagePickerScreenState();
}

class ImagePickerScreenState extends State<ImagePickerScreen> {
  String? _filePath;
  bool _isImagePicked = false;
  bool _isSavePicked = true;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
        _isImagePicked = true;
        _isSavePicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Image Change Screen',
          style: TextStyle(fontFamily: 'Jojo', color: AppColors.blue),
        ),
      ),
      body: Center(
        child: _filePath == null
            ? const Text('No image selected.')
            : Image.file(File(_filePath!)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!_isImagePicked)
            FloatingActionButton.extended(
              heroTag: "pickimage",
              onPressed: _pickImage,
              label: const Text("Pick Image"),
              icon: const Icon(Icons.add_a_photo),
            ),
          const SizedBox(height: 10),
          if (!_isSavePicked)
            FloatingActionButton.extended(
              onPressed: () {}, //_saveImageToDB,
              heroTag: "saveimage",
              label: const Text("Save Image"),
              icon: const Icon(Icons.save),
            ),
        ],
      ),
    );
  }
}
