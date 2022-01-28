class LoginModel {
  bool status;
  String message;
  LoginData data;

  LoginModel({bool? status, String? message, LoginData? data}):
    this.status = status ?? false,
    this.message = message ?? "",
    this.data = data ?? LoginData();

  LoginModel.fromJson(Map<String, dynamic> json):
    status = json['status']??false,
    message = json['message']??"",
    data = json['data'] != null ? LoginData.fromJson(json['data']) : LoginData();

}

class LoginData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  LoginData(
      {int? id,
      String? name,
      String? email,
      String? phone,
      String? image,
      int? points,
      int? credit,
      String? token}) :
    this.id = id ?? 0,
    this.name = name ?? "",
    this.email = email ?? "",
    this.phone = phone ?? "",
    this.image = image ?? "",
    this.points = points ?? 0,
    this.credit = credit ?? 0,
    this.token = token ?? "";


  LoginData.fromJson(Map<String, dynamic> json):
    id = json['id'] ?? 0,
    name = json['name'] ?? "",
    email = json['email'] ?? "",
    phone = json['phone'] ?? "",
    image = json['image'] ?? "",
    points = json['points'] ?? 0,
    credit = json['credit'] ?? 0,
    token = json['token'] ?? "";

}
