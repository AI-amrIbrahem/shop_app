class HomeModel {
  late   bool status;
  late   Data data;

  HomeModel({this.status = true , required this.data   });

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ??false;
    data = json['data'] != null ?  Data.fromJson(json['data']) : Data() ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  late List<Banners> banners;
  late List<Products> products;
  late String ad;

  Data({this.banners = const[], this.products = const[], this.ad=""});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add( Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['ad'] = this.ad;
    return data;
  }
}

class Banners {
  late int id;
  late String image;


  Banners({this.id = 0, this.image=""});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;

    return data;
  }
}

class Products {
  late int id;
  late double price;
  late double oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;

  Products(
      {this.id = 0,
        this.price = 0,
        this.oldPrice = 0,
        this.discount =0,
        this.image = "",
        this.name = "",
        this.description = "",
        this.images = const[],
        this.inFavorites =false,
        this.inCart = false});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;

    price = (json['price'] ?? 0)+0.0 ;
    oldPrice = (json['old_price'] ?? 0)+0.0;
    discount = json['discount'] ??0;
    image = json['image']??"";
    name = json['name']??"";
    description = json['description']??"";
    images = json['images'].cast<String>()??const[];
    inFavorites = json['in_favorites']??false;
    inCart = json['in_cart']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    return data;
  }
}