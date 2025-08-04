import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FunctionImage {
  static Future<File?> cameraPicker() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static galleryPicker() async {
    PermissionStatus status;
    if (Platform.isAndroid){
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        status = await Permission.photos.request();
      } else {
        status = await Permission.storage.request();
      }
    }else{
      status = await Permission.photos.request();
    }
    if(status.isGranted){
       var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      return File(image.path);
    }
    }
    return null;
  }
}
