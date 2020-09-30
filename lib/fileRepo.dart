import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class FileService with ChangeNotifier {
  List<Uint8List> fileList = List();

  Future<bool> getFiles(bool add) async {
    if (!add) {
      fileList = List();
    }
    FilePickerResult pickedFiles = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
      withData: true
    );
    if (pickedFiles != null) {
      pickedFiles.files.forEach((PlatformFile platformFile) {
        fileList.add(platformFile.bytes);
      });
      notifyListeners();
      return true;
    } else {
      fileList = List();
      notifyListeners();
      return false;
    }
  }
}