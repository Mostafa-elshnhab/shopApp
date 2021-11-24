class CatigoriesModel {
  bool? status;
  CatigoriesDataModel? data;
  CatigoriesModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    data = CatigoriesDataModel.fromjson(json['data']);
  }
}

class CatigoriesDataModel {
  int? current_page;
  List<Data> dataList = [];
  CatigoriesDataModel.fromjson(Map<String, dynamic> json) {
    current_page = json['current_page'];
    Iterable data = json['data'];
    dataList = data.map((e) => Data.fromjson((e))).toList();
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  Data.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
