class FavoritModel {
  bool? status;
  FavoritDataModel? data;
  FavoritModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    data = FavoritDataModel.fromjson(json['data']);
  }
}

class FavoritDataModel {
  List<FavDataModel>? favlist;
  FavoritDataModel.fromjson(Map<String, dynamic> json) {
    Iterable data = json['data'];
    favlist = data.map((e) => FavDataModel.fromjson((e))).toList();
  }
}

class FavDataModel {
  int? id;
  ProductFavModel? productFavModel;
  FavDataModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    productFavModel = ProductFavModel.fromjson(json['product']);
  }
}

class ProductFavModel {
  int? id;
  dynamic? price;
  dynamic? old_price;
  dynamic? discount;
  String? name;
  String? image;
  ProductFavModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
  }
}
