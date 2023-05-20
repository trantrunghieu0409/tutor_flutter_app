// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

class BecomeTutorReq {
  final String name;
  final String bio;
  final String interests;
  final String education;
  final XFile? avatar;
  BecomeTutorReq({
    required this.avatar,
    required this.name,
    required this.bio,
    required this.interests,
    required this.education,
  });
}
