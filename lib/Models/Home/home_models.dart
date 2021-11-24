class HomeModel {
  bool? status;
  DataModel? data;
  HomeModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    data = DataModel.fromjson(json['data']);
  }
}

class DataModel {
  List<Banners> bannerList = [];
  List<Products> productList = [];
  DataModel.fromjson(Map<String, dynamic> json) {
    Iterable banners = json['banners'];
    bannerList = banners.map((e) => Banners.fromjson((e))).toList();
    Iterable products = json['products'];
    productList = products.map((e) => Products.fromjson((e))).toList();
  }
}

class Banners {
  int? id;
  String? image;

  Banners.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Products {
  int? id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  bool? in_favorites;
  bool? in_cart;
  Products.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}
