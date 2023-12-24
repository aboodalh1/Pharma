class FavoriteModel {
  FavoriteModel({
      this.myfavorite,});

  FavoriteModel.fromJson(dynamic json) {
    if (json['my favorite'] != null) {
      myfavorite = [];
      json['my favorite'].forEach((v) {
        myfavorite?.add(MyFavorite.fromJson(v));
      });
    }
  }
  List<MyFavorite>? myfavorite;
FavoriteModel copyWith({  List<MyFavorite>? myfavorite,
}) => FavoriteModel(  myfavorite: myfavorite ?? this.myfavorite,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (myfavorite != null) {
      map['my favorite'] = myfavorite?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class MyFavorite {
  MyFavorite({
      this.id, 
      this.depotId, 
      this.userId, 
      this.depots,});

  MyFavorite.fromJson(dynamic json) {
    id = json['id'];
    depotId = json['depot_id'];
    userId = json['user_id'];
    depots = json['depots'] != null ? Depots.fromJson(json['depots']) : null;
  }
  num? id;
  num? depotId;
  num? userId;
  Depots? depots;
MyFavorite copyWith({  num? id,
  num? depotId,
  num? userId,
  Depots? depots,
}) => MyFavorite(  id: id ?? this.id,
  depotId: depotId ?? this.depotId,
  userId: userId ?? this.userId,
  depots: depots ?? this.depots,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['depot_id'] = depotId;
    map['user_id'] = userId;
    if (depots != null) {
      map['depots'] = depots?.toJson();
    }
    return map;
  }

}

class Depots {
  Depots({
      this.id, 
      this.medicineId, 
      this.userId, 
      this.classificationId, 
      this.quintity, 
      this.dateOfEnd, 
      this.price, 
      this.image, 
      this.medicine,});

  Depots.fromJson(dynamic json) {
    id = json['id'];
    medicineId = json['medicine_id'];
    userId = json['user_id'];
    classificationId = json['classification_id'];
    quintity = json['quintity'];
    dateOfEnd = json['date_of_end'];
    price = json['price'];
    image = json['image'];
    medicine = json['medicine'] != null ? Medicine.fromJson(json['medicine']) : null;
  }
  num? id;
  num? medicineId;
  num? userId;
  num? classificationId;
  num? quintity;
  String? dateOfEnd;
  num? price;
  dynamic image;
  Medicine? medicine;
Depots copyWith({  num? id,
  num? medicineId,
  num? userId,
  num? classificationId,
  num? quintity,
  String? dateOfEnd,
  num? price,
  dynamic image,
  Medicine? medicine,
}) => Depots(  id: id ?? this.id,
  medicineId: medicineId ?? this.medicineId,
  userId: userId ?? this.userId,
  classificationId: classificationId ?? this.classificationId,
  quintity: quintity ?? this.quintity,
  dateOfEnd: dateOfEnd ?? this.dateOfEnd,
  price: price ?? this.price,
  image: image ?? this.image,
  medicine: medicine ?? this.medicine,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['medicine_id'] = medicineId;
    map['user_id'] = userId;
    map['classification_id'] = classificationId;
    map['quintity'] = quintity;
    map['date_of_end'] = dateOfEnd;
    map['price'] = price;
    map['image'] = image;
    if (medicine != null) {
      map['medicine'] = medicine?.toJson();
    }
    return map;
  }

}

class Medicine {
  Medicine({
      this.id, 
      this.scientificName, 
      this.tradeName, 
      this.company,});

  Medicine.fromJson(dynamic json) {
    id = json['id'];
    scientificName = json['scientific_name'];
    tradeName = json['trade_name'];
    company = json['company'];
  }
  num? id;
  String? scientificName;
  String? tradeName;
  String? company;
Medicine copyWith({  num? id,
  String? scientificName,
  String? tradeName,
  String? company,
}) => Medicine(  id: id ?? this.id,
  scientificName: scientificName ?? this.scientificName,
  tradeName: tradeName ?? this.tradeName,
  company: company ?? this.company,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['scientific_name'] = scientificName;
    map['trade_name'] = tradeName;
    map['company'] = company;
    return map;
  }

}