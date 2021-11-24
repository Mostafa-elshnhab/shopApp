class EditeFavoritModel {
  bool? status;
  String? message;
  EditeFavoritDataModel? data;
  EditeFavoritModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = EditeFavoritDataModel.fromjson(json['data']);
  }
}

class EditeFavoritDataModel {
  int? id;
  EditeFavoritDProduct? product;
  EditeFavoritDataModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    product = EditeFavoritDProduct.fromjson(json['product']);
  }
}

class EditeFavoritDProduct {
  int? id;
  EditeFavoritDProduct.fromjson(Map<String, dynamic> json) {
    id = json['id'];
  }
}
