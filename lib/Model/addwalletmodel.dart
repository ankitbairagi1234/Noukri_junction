/// error : true
/// message : "wallet transactions Added Successfully"
/// data : {"user_id":"200","amount":"1000","transaction_id":"120","type":"credit"}

class AddWalletModel {
  AddWalletModel({
    bool? error,
    String? message,
    Data? data,}){
    _error = error;
    _message = message;
    _data = data;
  }

  AddWalletModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
  AddWalletModel copyWith({  bool? error,
    String? message,
    Data? data,
  }) => AddWalletModel(  error: error ?? _error,
    message: message ?? _message,
    data: data ?? _data,
  );
  bool? get error => _error;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user_id : "200"
/// amount : "1000"
/// transaction_id : "120"
/// type : "credit"

class Data {
  Data({
    String? userId,
    String? amount,
    String? transactionId,
    String? type,}){
    _userId = userId;
    _amount = amount;
    _transactionId = transactionId;
    _type = type;
  }

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _amount = json['amount'];
    _transactionId = json['transaction_id'];
    _type = json['type'];
  }
  String? _userId;
  String? _amount;
  String? _transactionId;
  String? _type;
  Data copyWith({  String? userId,
    String? amount,
    String? transactionId,
    String? type,
  }) => Data(  userId: userId ?? _userId,
    amount: amount ?? _amount,
    transactionId: transactionId ?? _transactionId,
    type: type ?? _type,
  );
  String? get userId => _userId;
  String? get amount => _amount;
  String? get transactionId => _transactionId;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['amount'] = _amount;
    map['transaction_id'] = _transactionId;
    map['type'] = _type;
    return map;
  }

}