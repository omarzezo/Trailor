import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      this.api, 
      this.code, 
      this.description, 
      this.hidePos, 
      this.id, 
      this.image, 
      this.imageUl, 
      this.name, 
      this.parentId, 
      this.slug,});

  Categories.fromJson(dynamic json) {
    api = json['api'];
    code = json['code'];
    description = json['description'];
    hidePos = json['hide_pos'];
    id = json['id'];
    image = json['image'];
    imageUl = json['image_ul'];
    name = json['name'];
    parentId = json['parent_id'];
    slug = json['slug'];
  }
  String? api;
  String? code;
  String? description;
  String? hidePos;
  String? id;
  dynamic image;
  dynamic imageUl;
  String? name;
  String? parentId;
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api'] = api;
    map['code'] = code;
    map['description'] = description;
    map['hide_pos'] = hidePos;
    map['id'] = id;
    map['image'] = image;
    map['image_ul'] = imageUl;
    map['name'] = name;
    map['parent_id'] = parentId;
    map['slug'] = slug;
    return map;
  }

}