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

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
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
          FloatingActionButton.extended(
            onPressed: _pickImage,
            label: const Text("Pick Image"),
            icon: const Icon(Icons.add_a_photo),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () {}, //_saveImageToDB,
            label: const Text("Save Image"),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
