// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class TutorMapperImpl extends TutorMapper {
  TutorMapperImpl() : super();

  @override
  TutorEntity fromModel(Rows model) {
    final tutorentity = TutorEntity(
      level: model.level,
      email: model.email,
      avatar: model.avatar,
      name: model.name,
      country: model.country,
      phone: model.phone,
      language: model.language,
      birthday: model.birthday,
      requestPassword: model.requestPassword,
      isActivated: model.isActivated,
      timezone: model.timezone,
      id: model.id,
      userId: model.userId,
      video: model.video,
      bio: model.bio,
      education: model.education,
      experience: model.experience,
      profession: model.profession,
      accent: model.accent,
      targetStudent: model.targetStudent,
      interests: model.interests,
      languages: model.languages,
      specialties: model.specialties,
      resume: model.resume,
      rating: model.rating,
      price: model.price,
      isOnline: model.isOnline,
    );
    return tutorentity;
  }
}
