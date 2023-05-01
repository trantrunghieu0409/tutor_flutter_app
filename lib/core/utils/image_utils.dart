import 'package:flutter/material.dart';

class ImageUtils {
  static String imagePath = "assets/images";

  static String defaultImagePath = "$imagePath/user.png";
  
  static String vnFlag = "$imagePath/vn_flag.png";
  static String englishFlag = "$imagePath/english_flag.png";

  static Image getImage(String? imageUrl) {
    return imageUrl != null
        ? Image.network(imageUrl)
        : Image.asset(ImageUtils.defaultImagePath);
  }

}
