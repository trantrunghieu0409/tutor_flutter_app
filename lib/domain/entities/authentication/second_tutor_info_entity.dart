class SecondTutorInfoEntity {
   SecondTutorInfoEntity({
    required this.id,
    required this.video,
    required this.bio,
    required this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    required this.interests,
    this.languages,
    this.specialties,
    this.resume,
    required this.rating,
    required this.isActivated,
    required this.isNative,
  });
  late final String id;
  late final String video;
  late final String bio;
  late final String education;
  late final String? experience;
  late final String? profession;
  late final String? accent;
  late final String? targetStudent;
  late final String interests;
  late final String? languages;
  late final String? specialties;
  late final String? resume;
  late final int rating;
  late final bool isActivated;
  late final bool isNative;
}