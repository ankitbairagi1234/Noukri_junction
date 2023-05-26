/// staus : true
/// message : "Success"
/// data : [{"id":"434","notification_type":"recruiter","title":"HII ","message":"Hello","date1":"22nd  January 2023 ","insert_date":"2023-01-22 08:42:24"}]

class NotificationModel {
  NotificationModel({
      bool? staus, 
      String? message, 
      List<Data>? data,}){
    _staus = staus;
    _message = message;
    _data = data;
}

  NotificationModel.fromJson(dynamic json) {
    _staus = json['staus'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _staus;
  String? _message;
  List<Data>? _data;
NotificationModel copyWith({  bool? staus,
  String? message,
  List<Data>? data,
}) => NotificationModel(  staus: staus ?? _staus,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get staus => _staus;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['staus'] = _staus;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "434"
/// notification_type : "recruiter"
/// title : "HII "
/// message : "Hello"
/// date1 : "22nd  January 2023 "
/// insert_date : "2023-01-22 08:42:24"

class Data {
  Data({
      String? id, 
      String? notificationType, 
      String? title, 
      String? message, 
      String? date1, 
      String? insertDate,}){
    _id = id;
    _notificationType = notificationType;
    _title = title;
    _message = message;
    _date1 = date1;
    _insertDate = insertDate;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _notificationType = json['notification_type'];
    _title = json['title'];
    _message = json['message'];
    _date1 = json['date1'];
    _insertDate = json['insert_date'];
  }
  String? _id;
  String? _notificationType;
  String? _title;
  String? _message;
  String? _date1;
  String? _insertDate;
Data copyWith({  String? id,
  String? notificationType,
  String? title,
  String? message,
  String? date1,
  String? insertDate,
}) => Data(  id: id ?? _id,
  notificationType: notificationType ?? _notificationType,
  title: title ?? _title,
  message: message ?? _message,
  date1: date1 ?? _date1,
  insertDate: insertDate ?? _insertDate,
);
  String? get id => _id;
  String? get notificationType => _notificationType;
  String? get title => _title;
  String? get message => _message;
  String? get date1 => _date1;
  String? get insertDate => _insertDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['notification_type'] = _notificationType;
    map['title'] = _title;
    map['message'] = _message;
    map['date1'] = _date1;
    map['insert_date'] = _insertDate;
    return map;
  }

}