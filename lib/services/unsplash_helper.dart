class MovieDbImagesProvider {
  static const String UNSPLASH_IMAGES_PROVIDER_URI_BASE =
      'https://images.unsplash.com/';
  static const String NORMAL_QUALITY = '?fit=crop&w=414&h=414&q=60';

  static String getUnsplashImage(String imagePath) {
    return '$UNSPLASH_IMAGES_PROVIDER_URI_BASE$imagePath$NORMAL_QUALITY';
  }
}
