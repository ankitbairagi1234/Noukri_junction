/// status : "true"
/// data : [{"id":"3","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:03:47","last_updated":"2023-04-22 15:03:47"},{"id":"4","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:05:13","last_updated":"2023-04-22 15:05:13"},{"id":"5","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:09:08","last_updated":"2023-04-22 15:09:08"},{"id":"6","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:09:30","last_updated":"2023-04-22 15:09:30"},{"id":"7","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:10:10","last_updated":"2023-04-22 15:10:10"},{"id":"8","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:10:29","last_updated":"2023-04-22 15:10:29"},{"id":"9","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:10:38","last_updated":"2023-04-22 15:10:38"},{"id":"10","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:11:15","last_updated":"2023-04-22 15:11:15"},{"id":"11","user_id":"115","type":"credit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:11:28","last_updated":"2023-04-22 15:11:28"},{"id":"12","user_id":"115","type":"debit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:11:43","last_updated":"2023-04-22 15:11:43"},{"id":"13","user_id":"115","type":"debit/cr","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:19:10","last_updated":"2023-04-22 15:19:10"},{"id":"14","user_id":"115","type":"debit/cr","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:19:33","last_updated":"2023-04-22 15:19:33"},{"id":"15","user_id":"115","type":"debit/cr","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:20:02","last_updated":"2023-04-22 15:20:02"},{"id":"16","user_id":"115","type":"debit/cr","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:21:13","last_updated":"2023-04-22 15:21:13"},{"id":"17","user_id":"115","type":"debit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:22:40","last_updated":"2023-04-22 15:22:40"},{"id":"18","user_id":"115","type":"debit/","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:22:52","last_updated":"2023-04-22 15:22:52"},{"id":"19","user_id":"115","type":"debit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-22 15:22:56","last_updated":"2023-04-22 15:22:56"},{"id":"20","user_id":"115","type":"debit","amount":"1000","message":"","transaction_id":"120","status":"0","date_created":"2023-04-24 14:21:59","last_updated":"2023-04-24 14:21:59"},{"id":"21","user_id":"115","type":"debit","amount":"1000","message":"","transaction_id":"119","status":"0","date_created":"2023-04-24 14:22:22","last_updated":"2023-04-24 14:22:22"}]
/// message : "Transaction Get Successfully"

class Getwalletmodel {
  Getwalletmodel({
      String? status, 
      List<Data>? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  Getwalletmodel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _status;
  List<Data>? _data;
  String? _message;
Getwalletmodel copyWith({  String? status,
  List<Data>? data,
  String? message,
}) => Getwalletmodel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  String? get status => _status;
  List<Data>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : "3"
/// user_id : "115"
/// type : "credit"
/// amount : "1000"
/// message : ""
/// transaction_id : "120"
/// status : "0"
/// date_created : "2023-04-22 15:03:47"
/// last_updated : "2023-04-22 15:03:47"

class Data {
  Data({
      String? id, 
      String? userId, 
      String? type, 
      String? amount, 
      String? message, 
      String? transactionId, 
      String? status, 
      String? dateCreated, 
      String? lastUpdated,}){
    _id = id;
    _userId = userId;
    _type = type;
    _amount = amount;
    _message = message;
    _transactionId = transactionId;
    _status = status;
    _dateCreated = dateCreated;
    _lastUpdated = lastUpdated;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _type = json['type'];
    _amount = json['amount'];
    _message = json['message'];
    _transactionId = json['transaction_id'];
    _status = json['status'];
    _dateCreated = json['date_created'];
    _lastUpdated = json['last_updated'];
  }
  String? _id;
  String? _userId;
  String? _type;
  String? _amount;
  String? _message;
  String? _transactionId;
  String? _status;
  String? _dateCreated;
  String? _lastUpdated;
Data copyWith({  String? id,
  String? userId,
  String? type,
  String? amount,
  String? message,
  String? transactionId,
  String? status,
  String? dateCreated,
  String? lastUpdated,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  type: type ?? _type,
  amount: amount ?? _amount,
  message: message ?? _message,
  transactionId: transactionId ?? _transactionId,
  status: status ?? _status,
  dateCreated: dateCreated ?? _dateCreated,
  lastUpdated: lastUpdated ?? _lastUpdated,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get type => _type;
  String? get amount => _amount;
  String? get message => _message;
  String? get transactionId => _transactionId;
  String? get status => _status;
  String? get dateCreated => _dateCreated;
  String? get lastUpdated => _lastUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['type'] = _type;
    map['amount'] = _amount;
    map['message'] = _message;
    map['transaction_id'] = _transactionId;
    map['status'] = _status;
    map['date_created'] = _dateCreated;
    map['last_updated'] = _lastUpdated;
    return map;
  }

}