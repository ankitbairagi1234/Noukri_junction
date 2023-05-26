import 'dart:convert';
SignupModel? signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel? data) => json.encode(data!.toJson());

class SignupModel {
  SignupModel({
    this.staus,
    this.message,
    this.data,
  });

  String? staus;
  String? message;
  Data? data;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    staus: json["staus"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "staus": staus,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.mno,
    this.ps,
    this.orgType,
    this.location,
    this.address,
    this.website,
    this.company,
    this.token,
    this.des,
    this.veri,
    this.img,
    this.plan,
    this.otp,
    this.pay,
    this.payDate,
    this.type,
    this.month,
    this.showOnReg,
    this.status,
    this.description,
    this.payCount,
    this.paypal,
    this.counter,
    this.googleId,
    this.insertDate,
    this.ps2,
  });

  String? id;
  String? name;
  String? email;
  String? mno;
  String? ps;
  String? orgType;
  String? location;
  String? address;
  String? website;
  String? company;
  String? token;
  String? des;
  String? veri;
  String? img;
  dynamic plan;
  String? otp;
  String? pay;
  dynamic payDate;
  dynamic type;
  dynamic month;
  dynamic showOnReg;
  String? status;
  String? description;
  String? payCount;
  dynamic paypal;
  String? counter;
  dynamic googleId;
  DateTime? insertDate;
  String? ps2;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mno: json["mno"],
    ps: json["ps"],
    orgType: json["org_type"],
    location: json["location"],
    address: json["address"],
    website: json["website"],
    company: json["company"],
    token: json["token"],
    des: json["des"],
    veri: json["veri"],
    img: json["img"],
    plan: json["plan"],
    otp: json["otp"],
    pay: json["pay"],
    payDate: json["pay_date"],
    type: json["type"],
    month: json["month"],
    showOnReg: json["show_on_reg"],
    status: json["status"],
    description: json["description"],
    payCount: json["pay_count"],
    paypal: json["paypal"],
    counter: json["counter"],
    googleId: json["google_id"],
    insertDate: DateTime.parse(json["insert_date"]),
    ps2: json["ps2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mno": mno,
    "ps": ps,
    "org_type": orgType,
    "location": location,
    "address": address,
    "website": website,
    "company": company,
    "token": token,
    "des": des,
    "veri": veri,
    "img": img,
    "plan": plan,
    "otp": otp,
    "pay": pay,
    "pay_date": payDate,
    "type": type,
    "month": month,
    "show_on_reg": showOnReg,
    "status": status,
    "description": description,
    "pay_count": payCount,
    "paypal": paypal,
    "counter": counter,
    "google_id": googleId,
    "insert_date": insertDate?.toIso8601String(),
    "ps2": ps2,
  };
}
