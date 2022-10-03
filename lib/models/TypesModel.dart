class TypesModel {
  TypesModel({
    this.id,
    this.name,
    this.image,
    this.selected,
    this.frontImage,
    this.backImage,
    });

  TypesModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    selected = json['selected'];
    frontImage = json['frontImage'];
    backImage = json['backImage'];
  }

  int? id;
  String? name;
  String? image;
  bool? selected;
  String? frontImage;
  String? backImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['frontImage'] = frontImage;
    map['backImage'] = backImage;
    return map;
  }

}