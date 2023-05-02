import 'package:flutter/material.dart';

class ImageUtils {
  static String imagePath = "assets/images";
  static String chatGPTLogo = "$imagePath/flutter_logo.png";
  static String userIcon = "$imagePath/person.png";
  static String gptIcon = "$imagePath/chat_icon.png";

  static String defaultImagePath = "$imagePath/user.png";
  static String resetPasswordPath = "$imagePath/resetpassword.png";

  static String vnFlag = "$imagePath/vn_flag.png";
  static String englishFlag = "$imagePath/english_flag.png";

  static Image getImage(String? imageUrl) {
    return imageUrl != null
        ? Image.network(
            imageUrl,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(ImageUtils.defaultImagePath);
            },
          )
        : Image.asset(ImageUtils.defaultImagePath);
  }
}
