class CategoryModel {
  late bool status;
  late CategoryDataModel data;

  CategoryModel({required this.status , required this.data });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status']??false;
    data = json['data'] != null ?  CategoryDataModel.fromJson(json['data']) : CategoryDataModel();
  }

}

class CategoryDataModel {
  late int currentPage;
  late List<DataModel> data;


  CategoryDataModel({this.currentPage = 0, this.data = const[]});

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] ?? 0;
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data.add( DataModel.fromJson(v));
      });
    }
  }

}

class DataModel {
  late int id;
  late String name;
  late String image;

  DataModel({this.id = 0, this.name = "", this.image = ""});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ??0;
    name = json['name']??"";
    image = json['image']??"";
  }

}