// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class BookMapperImpl extends BookMapper {
  BookMapperImpl() : super();

  @override
  BookEntity fromModel(Rows model) {
    final bookentity = BookEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      imageUrl: model.imageUrl,
      level: model.level,
      visible: model.visible,
      fileUrl: model.fileUrl,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      isPrivate: model.isPrivate,
      createdBy: model.createdBy,
      categories: model.categories.map((x) => fromCategory(x)).toList(),
    );
    return bookentity;
  }

  @override
  CategoryEntity fromCategory(Categories categories) {
    final categoryentity = CategoryEntity(
      id: categories.id,
      title: categories.title,
      description: categories.description,
      key: categories.key,
    );
    return categoryentity;
  }
}
