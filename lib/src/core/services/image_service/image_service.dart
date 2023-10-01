abstract interface class ImageService {
  Future<String?> getImageFromGallery();
  Future<String?> getImageFromCamera();
  Future<String> saveImage(String fileName, List<int> data);
  Future<void> deleteImage(String? imagePath);
}
