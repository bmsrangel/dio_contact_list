import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../core/services/image_service/image_service.dart';

@injectable
class EditContactController {
  EditContactController(this._imageService);

  final ImageService _imageService;
  final ValueNotifier<String?> avatarUrl = ValueNotifier(null);

  Future<void> getPictureFromCamera() async {
    final imagePath = await _imageService.getImageFromCamera();
    avatarUrl.value = imagePath;
  }

  Future<void> getPictureFromGallery() async {
    final imagePath = await _imageService.getImageFromGallery();
    avatarUrl.value = imagePath;
  }

  void clearAvatarUrl() async {
    avatarUrl.value = null;
  }
}
