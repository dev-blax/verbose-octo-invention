import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }

  print('no image selected');
}

Future<void> uploadImage(File imageFile) async {
  final url = Uri.parse('192.168.1.46:8081/PostEditDelete/upload');
  final request = http.MultipartRequest('POST', url);
  request.files.add(
    await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
    ),
  );

  try {
    final response = await request.send();
    if (response.statusCode == 200) {
      print('image upload success');
    } else {
      print('non 200');
    }
  } catch (e) {
    print('error $e');
  }
}
