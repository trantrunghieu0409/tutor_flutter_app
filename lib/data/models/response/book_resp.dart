class BookResp {
  BookResp({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;
  
  BookResp.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.count,
    required this.rows,
  });
  late final int count;
  late final List<Rows> rows;
  
  Data.fromJson(Map<String, dynamic> json){
    count = json['count'];
    rows = List.from(json['rows']).map((e)=>Rows.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['rows'] = rows.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Rows {
  Rows({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.visible,
    required this.fileUrl,
    required this.createdAt,
    required this.updatedAt,
     this.isPrivate,
     this.createdBy,
    required this.categories,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final String level;
  late final bool visible;
  late final String fileUrl;
  late final String createdAt;
  late final String updatedAt;
  late final Null isPrivate;
  late final Null createdBy;
  late final List<Categories> categories;
  
  Rows.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    level = json['level'];
    visible = json['visible'];
    fileUrl = json['fileUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isPrivate = null;
    createdBy = null;
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    _data['level'] = level;
    _data['visible'] = visible;
    _data['fileUrl'] = fileUrl;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['isPrivate'] = isPrivate;
    _data['createdBy'] = createdBy;
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.title,
     this.description,
    required this.key,
     this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String title;
  late final Null description;
  late final String key;
  late final Null displayOrder;
  late final String createdAt;
  late final String updatedAt;
  
  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = null;
    key = json['key'];
    displayOrder = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['key'] = key;
    _data['displayOrder'] = displayOrder;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}