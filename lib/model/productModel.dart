class ProductModel {
  String? facName;
  String? catName;
  String? facLocation;
  double? price;
  String? valid;
  String? medName;
  String? medPic;
  late bool isFavorite;
  late int counter;

  ProductModel({
    this.facName,
    this.catName,
    this.facLocation,
    this.price,
    this.valid,
    this.medName,
    required this.isFavorite,
    required this.counter,
  });
}

List<ProductModel> list = [
  ProductModel(
    medName: "Paracetamol",
    facName: "ibn Sina",
    catName: "med",
    valid: '2022',
    facLocation: 'KFRSOSA',
    price: 20000,
    isFavorite: false,
    counter: 0,
  ),
  ProductModel(
      medName: "Paracetamol1",
      facName: "ibn Sina",
      catName: "med",
      valid: '2022',
      facLocation: 'KFRSOSA',
      price: 20000,
      isFavorite: true,
      counter: 0),
  ProductModel(
    medName: "Paracetamol2",
    facName: "ibn Sina",
    catName: "med",
    valid: '2022',
    facLocation: 'KFRSOSA',
    price: 20000,
    isFavorite: false,
    counter: 0,
  ),
  ProductModel(
    medName: "Paracetamol3",
    facName: "ibn Sina",
    catName: "med",
    valid: '2022',
    facLocation: 'KFRSOSA',
    price: 20000,
    isFavorite: false,
    counter: 0,
  ),
  ProductModel(
    medName: "Paracetamol4",
    facName: "ibn Sina",
    catName: "med",
    valid: '2022',
    facLocation: 'KFRSOSA',
    price: 20000,
    isFavorite: true,
    counter: 0,
  ),
  ProductModel(
    medName: "Paracetamol5",
    facName: "ibn Sina",
    catName: "med",
    valid: '2022',
    facLocation: 'KFRSOSA',
    price: 20000,
    isFavorite: false,
    counter: 0,
  ),
];
