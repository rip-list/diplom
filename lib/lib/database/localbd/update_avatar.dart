// ignore_for_file: avoid_print

import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadAvatar(File file, String userId) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://localhost:3000/upload'),
  );
  request.files.add(
    await http.MultipartFile.fromPath(
      'file',
      file.path,
    ),
  );
  request.fields['userId'] = userId; // Передаем ID пользователя в запросе

  var response = await request.send();
  if (response.statusCode == 200) {
    print('Аватар успешно загружен на сервер и привязан к пользователю');
  } else {
    print('Ошибка загрузки аватара: ${response.statusCode}');
  }
}
