import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inovola_task/core/errors/failure.dart';

abstract class PickersService {
  Future<File?> pickImage(ImageSource source);
  Future<File?> pickFile();
}

class PickersServiceImpl implements PickersService {
  @override
  Future<File?> pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        final File imageFile = File(image.path);
        return imageFile;
      }
    } catch (e) {
      throw CustomFailure(e.toString());
    }
    return null;
  }

  @override
  Future<File?> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt', 'jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final File file = File(result.files.single.path!);
        return file;
      }
    } catch (e) {
      throw CustomFailure(e.toString());
    }
    return null;
  }
}
