class CatModel {
  CatModel({
      this.classifications,});

  CatModel.fromJson(dynamic json) {
    if (json['classifications'] != null) {
      classifications = [];
      json['classifications'].forEach((v) {
        classifications?.add(Classifications.fromJson(v));
      });
    }
  }
  List<Classifications>? classifications;
CatModel copyWith({  List<Classifications>? classifications,
}) => CatModel(  classifications: classifications ?? this.classifications,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (classifications != null) {
      map['classifications'] = classifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Classifications {
  Classifications({
      this.id, 
      this.name, 
      this.createdAt, 
      this.updatedAt,});

  Classifications.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? createdAt;
  String? updatedAt;
Classifications copyWith({  num? id,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => Classifications(  id: id ?? this.id,
  name: name ?? this.name,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}