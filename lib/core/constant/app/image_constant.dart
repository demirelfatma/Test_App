class ImageConstant {
  static ImageConstant? _instace;
  static ImageConstant get instance {
    _instace ??= ImageConstant._init();
    return _instace!;
  }

  ImageConstant._init();
  final red = "red".toPng;
}

extension _ImagePathExtension on String {
  String get toPng => "assets/png/$this.png";
}
