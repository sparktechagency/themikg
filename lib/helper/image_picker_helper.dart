import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> pickFromGallery() async{
    final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedFile !=null){
      return File(pickedFile.path);
    }
    return null;
  }
  Future<File?> pickFromCamera() async {
    final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
  Future<File?> pickVideoFromCamera() async{
    final XFile? pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
    if(pickedFile !=null){
      return File(pickedFile.path);
    }
    return null;
  }
}