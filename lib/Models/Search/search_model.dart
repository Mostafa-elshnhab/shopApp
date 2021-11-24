class SearchModel {
  bool? status;
  SearchDataModel? data;
  SearchModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    data = SearchDataModel.fromjson(json['data']);
  }
}

class SearchDataModel {
  List<ProductSearchModel>? productlist;
  SearchDataModel.fromjson(Map<String, dynamic> json) {
    Iterable data = json['data'];
    productlist = data.map((e) => ProductSearchModel.fromjson((e))).toList();
  }
}

class ProductSearchModel {
  int? id;
  dynamic? price;
  dynamic? old_price;
  dynamic? discount;
  String? name;
  String? image;
  ProductSearchModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
  }
}
