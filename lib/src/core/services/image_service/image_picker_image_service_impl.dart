import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pp;

import 'image_service.dart';

@LazySingleton(as: ImageService)
class ImagePickerImageServiceImpl implements ImageService {
  ImagePickerImageServiceImpl(
    this._imagePicker,
    this._imageCropper,
  );

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  @override
  Future<String?> getImageFromCamera() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    final imagePath = image?.path;
    if (imagePath != null) {
      final croppedImage = await _imageCropper.cropImage(
        sourcePath: imagePath,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      );
      return croppedImage?.path;
    } else {
      return null;
    }
  }

  @override
  Future<String?> getImageFromGallery() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    final imagePath = image?.path;
    if (imagePath != null) {
      final croppedImage = await _imageCropper.cropImage(
        sourcePath: imagePath,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      );
      return croppedImage?.path;
    } else {
      return null;
    }
  }

  @override
  Future<String> saveImage(String fileName, List<int> data) async {
    final directory = await pp.getApplicationDocumentsDirectory();
    final imagePath = path.join(directory.path, fileName);
    final file = File(imagePath);
    await file.writeAsBytes(data);
    return file.path;
  }

  @override
  Future<void> deleteImage(String? imagePath) async {
    if (imagePath != null) {
      final imageFile = File(imagePath);
      await imageFile.delete();
    }
  }
}
