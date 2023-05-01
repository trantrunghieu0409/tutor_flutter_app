class CourseResp {
  CourseResp({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;
  
  CourseResp.fromJson(Map<String, dynamic> json){
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
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
     this.courseType,
     this.sectionType,
    required this.visible,
     this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.topics,
    required this.categories,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final String level;
  late final String reason;
  late final String purpose;
  late final String otherDetails;
  late final int defaultPrice;
  late final int coursePrice;
  late final Null courseType;
  late final Null sectionType;
  late final bool visible;
  late final Null displayOrder;
  late final String createdAt;
  late final String updatedAt;
  late final List<Topics> topics;
  late final List<Categories> categories;
  
  Rows.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    level = json['level'];
    reason = json['reason'];
    purpose = json['purpose'];
    otherDetails = json['other_details'];
    defaultPrice = json['default_price'];
    coursePrice = json['course_price'];
    courseType = null;
    sectionType = null;
    visible = json['visible'];
    displayOrder = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    topics = List.from(json['topics']).map((e)=>Topics.fromJson(e)).toList();
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    _data['level'] = level;
    _data['reason'] = reason;
    _data['purpose'] = purpose;
    _data['other_details'] = otherDetails;
    _data['default_price'] = defaultPrice;
    _data['course_price'] = coursePrice;
    _data['courseType'] = courseType;
    _data['sectionType'] = sectionType;
    _data['visible'] = visible;
    _data['displayOrder'] = displayOrder;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['topics'] = topics.map((e)=>e.toJson()).toList();
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Topics {
  Topics({
    required this.id,
    required this.courseId,
    required this.orderCourse,
    required this.name,
    required this.nameFile,
     this.numberOfPages,
    required this.description,
     this.videoUrl,
     this.type,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String courseId;
  late final int orderCourse;
  late final String name;
  late final String nameFile;
  late final Null numberOfPages;
  late final String description;
  late final Null videoUrl;
  late final Null type;
  late final String createdAt;
  late final String updatedAt;
  
  Topics.fromJson(Map<String, dynamic> json){
    id = json['id'];
    courseId = json['courseId'];
    orderCourse = json['orderCourse'];
    name = json['name'];
    nameFile = json['nameFile'];
    numberOfPages = null;
    description = json['description'];
    videoUrl = null;
    type = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['courseId'] = courseId;
    _data['orderCourse'] = orderCourse;
    _data['name'] = name;
    _data['nameFile'] = nameFile;
    _data['numberOfPages'] = numberOfPages;
    _data['description'] = description;
    _data['videoUrl'] = videoUrl;
    _data['type'] = type;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
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
  late final String? description;
  late final String key;
  late final Null displayOrder;
  late final String createdAt;
  late final String updatedAt;
  
  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
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