// ignore_for_file: avoid_print, unused_import

import 'package:dio/dio.dart';
import 'package:diplom/constant/import_const.dart';
import 'package:diplom/constant/restart_app.dart';
import '../../custom/import_lib.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  ImagePickerScreenState createState() => ImagePickerScreenState();
}

class ImagePickerScreenState extends State<ImagePickerScreen>
    with SingleTickerProviderStateMixin {
  String? _filePath;
  bool _isImagePicked = false;
  bool _isSavePicked = true;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

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

  Future<void> _saveImageToDB() async {
    if (_filePath == null) return;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString("authToken");

      File imageFile = File(_filePath!);
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
        "userId": userId,
      });

      Dio dio = Dio();
      Response response = await dio.post(
        "http://localhost:3000/upload",
        data: formData,
      );

      if (response.statusCode == 200) {
        print("Image uploaded successfully");
        String newAvatarUrl =
            response.data["avatarUrl"]; // сервер возвращает ключ "avatarUrl"

        // Сохранение URL аватара в SharedPreferences
        await prefs.setString('avatarUrl', newAvatarUrl);

        // Закрываем экран изменения аватара и передаем новый URL
        if (mounted) {
          Navigator.pop(context, newAvatarUrl);
        }
      } else {
        print("Failed to upload image");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _colorAnimation =
        ColorTween(begin: AppColors.blue, end: AppColors.red).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text('Image Change Screen'),
      ),
      body: Center(
        child: _filePath == null
            ? const Text(
                'No image selected.',
                style: TextStyle(color: AppColors.white),
              )
            : Image.file(File(_filePath!)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!_isImagePicked)
            MouseRegion(
              onEnter: (_) => _controller.forward(),
              onExit: (_) => _controller.reverse(),
              child: AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return FloatingActionButton.extended(
                    heroTag: "pickimage",
                    onPressed: _pickImage,
                    label: const Text("Pick Image"),
                    backgroundColor: _colorAnimation.value,
                    icon: const Icon(Icons.add_a_photo),
                  );
                },
              ),
            ),
          if (!_isSavePicked)
            MouseRegion(
              onEnter: (_) => _controller.forward(),
              onExit: (_) => _controller.reverse(),
              child: AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return FloatingActionButton.extended(
                    heroTag: "saveimage",
                    onPressed: _saveImageToDB,
                    label: const Text("Pick Image"),
                    backgroundColor: _colorAnimation.value,
                    icon: const Icon(Icons.save),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
