class FavoriteModel {
  late bool status;
  late DataModel data;


  FavoriteModel({this.status = false,required this.data });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  DataModel.fromJson(json['data']) : DataModel();
  }

}

class DataModel {
  late int currentPage;
  late List<Data> data;
  late String firstPageUrl;
  late int from;
  late int lastPage;
  late String lastPageUrl;
  late String path;
  late int perPage;
  late int to;
  late int total;


  DataModel(
      {this.currentPage = 0,
      this.data =const [],
      this.firstPageUrl="",
      this.from=0,
      this.lastPage=0,
      this.lastPageUrl="",
      this.path="",
      this.perPage=0,
      this.to=0,
      this.total=0});

  DataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}

class Data {
  late int id;
  late Product product;


  Data({this.id = 0, required this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'] != null ?  Product.fromJson(json['product']) : Product();
  }


}

class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;


  Product(
      {this.id = 0,
      this.price = 0,
      this.oldPrice = 0,
      this.discount = 0,
      this.image = "",
      this.name = "",
      this.description = ""});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }


}