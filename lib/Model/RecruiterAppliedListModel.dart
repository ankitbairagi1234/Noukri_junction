/// status : "true"
/// data : [{"job_id":"3","user":{"id":"129","name":"Shivam","surname":"kanathe","email":"shivam1@gmail.com","city":"","hq":"","yp":"2017","mno":"3636363636","ps":"25d55ad283aa400af464c76d713c07ad","gender":"male","current":"50000","expected":"100000","current_address":"Prince nagar indore,madhya pradesh","location":"Jaipur","job_type":"Full Time","job_role":"0","designation":"0","qua":"B.Tech","p_year":null,"cgpa":"58","otp":"4508","keyskills":"Flutter,react","aofs":null,"exp":"7","resume":"uploads/resume/IMG-20221227-WA00004.jpg","specialization":"","veri":null,"img":"uploads/resume/15151254.png","counter":"0","status":null,"token":null,"google_id":null,"profile":"","insert_date":"2023-01-18 10:04:56","ps2":"","age":"23","notice_period":"24","is_profile_updated":"1"}},{"job_id":"1","user":{"id":"207","name":"Helloworld ","surname":"user","email":"hello@gmail.com","city":"","hq":"","yp":"0","mno":"9999999999","ps":"25d55ad283aa400af464c76d713c07ad","gender":"male","current":"500000","expected":"8000000","current_address":"prince nagar indore ","location":"Hyderabad","job_type":"Full Time","job_role":"Engineering","designation":"Assistant Manager","qua":"B.E.","p_year":null,"cgpa":"70","otp":"5328","keyskills":"flutter, react","aofs":null,"exp":"6","resume":"uploads/resume/Invoice_173.pdf","specialization":"","veri":null,"img":"uploads/resume/image_picker3875998447375393162.jpg","counter":"0","status":"Active","token":null,"google_id":null,"profile":"","insert_date":"2023-01-20 10:26:31","ps2":"","age":"23","notice_period":"20","is_profile_updated":"1"}},{"job_id":"3","user":{"id":"207","name":"Helloworld ","surname":"user","email":"hello@gmail.com","city":"","hq":"","yp":"0","mno":"9999999999","ps":"25d55ad283aa400af464c76d713c07ad","gender":"male","current":"500000","expected":"8000000","current_address":"prince nagar indore ","location":"Hyderabad","job_type":"Full Time","job_role":"Engineering","designation":"Assistant Manager","qua":"B.E.","p_year":null,"cgpa":"70","otp":"5328","keyskills":"flutter, react","aofs":null,"exp":"6","resume":"uploads/resume/Invoice_173.pdf","specialization":"","veri":null,"img":"uploads/resume/image_picker3875998447375393162.jpg","counter":"0","status":"Active","token":null,"google_id":null,"profile":"","insert_date":"2023-01-20 10:26:31","ps2":"","age":"23","notice_period":"20","is_profile_updated":"1"}}]
/// message : "Job applied success"

class RecruiterAppliedListModel {
  RecruiterAppliedListModel({
      String? status, 
      List<Data>? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  RecruiterAppliedListModel.fromJson(dynamic json) {
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
RecruiterAppliedListModel copyWith({  String? status,
  List<Data>? data,
  String? message,
}) => RecruiterAppliedListModel(  status: status ?? _status,
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

/// job_id : "3"
/// user : {"id":"129","name":"Shivam","surname":"kanathe","email":"shivam1@gmail.com","city":"","hq":"","yp":"2017","mno":"3636363636","ps":"25d55ad283aa400af464c76d713c07ad","gender":"male","current":"50000","expected":"100000","current_address":"Prince nagar indore,madhya pradesh","location":"Jaipur","job_type":"Full Time","job_role":"0","designation":"0","qua":"B.Tech","p_year":null,"cgpa":"58","otp":"4508","keyskills":"Flutter,react","aofs":null,"exp":"7","resume":"uploads/resume/IMG-20221227-WA00004.jpg","specialization":"","veri":null,"img":"uploads/resume/15151254.png","counter":"0","status":null,"token":null,"google_id":null,"profile":"","insert_date":"2023-01-18 10:04:56","ps2":"","age":"23","notice_period":"24","is_profile_updated":"1"}

class Data {
  Data({
      String? jobId, 
      User? user,}){
    _jobId = jobId;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _jobId = json['job_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _jobId;
  User? _user;
Data copyWith({  String? jobId,
  User? user,
}) => Data(  jobId: jobId ?? _jobId,
  user: user ?? _user,
);
  String? get jobId => _jobId;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['job_id'] = _jobId;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : "129"
/// name : "Shivam"
/// surname : "kanathe"
/// email : "shivam1@gmail.com"
/// city : ""
/// hq : ""
/// yp : "2017"
/// mno : "3636363636"
/// ps : "25d55ad283aa400af464c76d713c07ad"
/// gender : "male"
/// current : "50000"
/// expected : "100000"
/// current_address : "Prince nagar indore,madhya pradesh"
/// location : "Jaipur"
/// job_type : "Full Time"
/// job_role : "0"
/// designation : "0"
/// qua : "B.Tech"
/// p_year : null
/// cgpa : "58"
/// otp : "4508"
/// keyskills : "Flutter,react"
/// aofs : null
/// exp : "7"
/// resume : "uploads/resume/IMG-20221227-WA00004.jpg"
/// specialization : ""
/// veri : null
/// img : "uploads/resume/15151254.png"
/// counter : "0"
/// status : null
/// token : null
/// google_id : null
/// profile : ""
/// insert_date : "2023-01-18 10:04:56"
/// ps2 : ""
/// age : "23"
/// notice_period : "24"
/// is_profile_updated : "1"

class User {
  User({
      String? id, 
      String? name, 
      String? surname, 
      String? email, 
      String? city, 
      String? hq, 
      String? yp, 
      String? mno, 
      String? ps, 
      String? gender, 
      String? current, 
      String? expected, 
      String? currentAddress, 
      String? location, 
      String? jobType, 
      String? jobRole, 
      String? designation, 
      String? qua, 
      dynamic pYear, 
      String? cgpa, 
      String? otp, 
      String? keyskills, 
      dynamic aofs, 
      String? exp, 
      String? resume, 
      String? specialization, 
      dynamic veri, 
      String? img, 
      String? counter, 
      dynamic status, 
      dynamic token, 
      dynamic googleId, 
      String? profile, 
      String? insertDate, 
      String? ps2, 
      String? age, 
      String? noticePeriod, 
      String? isProfileUpdated,}){
    _id = id;
    _name = name;
    _surname = surname;
    _email = email;
    _city = city;
    _hq = hq;
    _yp = yp;
    _mno = mno;
    _ps = ps;
    _gender = gender;
    _current = current;
    _expected = expected;
    _currentAddress = currentAddress;
    _location = location;
    _jobType = jobType;
    _jobRole = jobRole;
    _designation = designation;
    _qua = qua;
    _pYear = pYear;
    _cgpa = cgpa;
    _otp = otp;
    _keyskills = keyskills;
    _aofs = aofs;
    _exp = exp;
    _resume = resume;
    _specialization = specialization;
    _veri = veri;
    _img = img;
    _counter = counter;
    _status = status;
    _token = token;
    _googleId = googleId;
    _profile = profile;
    _insertDate = insertDate;
    _ps2 = ps2;
    _age = age;
    _noticePeriod = noticePeriod;
    _isProfileUpdated = isProfileUpdated;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _surname = json['surname'];
    _email = json['email'];
    _city = json['city'];
    _hq = json['hq'];
    _yp = json['yp'];
    _mno = json['mno'];
    _ps = json['ps'];
    _gender = json['gender'];
    _current = json['current'];
    _expected = json['expected'];
    _currentAddress = json['current_address'];
    _location = json['location'];
    _jobType = json['job_type'];
    _jobRole = json['job_role'];
    _designation = json['designation'];
    _qua = json['qua'];
    _pYear = json['p_year'];
    _cgpa = json['cgpa'];
    _otp = json['otp'];
    _keyskills = json['keyskills'];
    _aofs = json['aofs'];
    _exp = json['exp'];
    _resume = json['resume'];
    _specialization = json['specialization'];
    _veri = json['veri'];
    _img = json['img'];
    _counter = json['counter'];
    _status = json['status'];
    _token = json['token'];
    _googleId = json['google_id'];
    _profile = json['profile'];
    _insertDate = json['insert_date'];
    _ps2 = json['ps2'];
    _age = json['age'];
    _noticePeriod = json['notice_period'];
    _isProfileUpdated = json['is_profile_updated'];
  }
  String? _id;
  String? _name;
  String? _surname;
  String? _email;
  String? _city;
  String? _hq;
  String? _yp;
  String? _mno;
  String? _ps;
  String? _gender;
  String? _current;
  String? _expected;
  String? _currentAddress;
  String? _location;
  String? _jobType;
  String? _jobRole;
  String? _designation;
  String? _qua;
  dynamic _pYear;
  String? _cgpa;
  String? _otp;
  String? _keyskills;
  dynamic _aofs;
  String? _exp;
  String? _resume;
  String? _specialization;
  dynamic _veri;
  String? _img;
  String? _counter;
  dynamic _status;
  dynamic _token;
  dynamic _googleId;
  String? _profile;
  String? _insertDate;
  String? _ps2;
  String? _age;
  String? _noticePeriod;
  String? _isProfileUpdated;
User copyWith({  String? id,
  String? name,
  String? surname,
  String? email,
  String? city,
  String? hq,
  String? yp,
  String? mno,
  String? ps,
  String? gender,
  String? current,
  String? expected,
  String? currentAddress,
  String? location,
  String? jobType,
  String? jobRole,
  String? designation,
  String? qua,
  dynamic pYear,
  String? cgpa,
  String? otp,
  String? keyskills,
  dynamic aofs,
  String? exp,
  String? resume,
  String? specialization,
  dynamic veri,
  String? img,
  String? counter,
  dynamic status,
  dynamic token,
  dynamic googleId,
  String? profile,
  String? insertDate,
  String? ps2,
  String? age,
  String? noticePeriod,
  String? isProfileUpdated,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  surname: surname ?? _surname,
  email: email ?? _email,
  city: city ?? _city,
  hq: hq ?? _hq,
  yp: yp ?? _yp,
  mno: mno ?? _mno,
  ps: ps ?? _ps,
  gender: gender ?? _gender,
  current: current ?? _current,
  expected: expected ?? _expected,
  currentAddress: currentAddress ?? _currentAddress,
  location: location ?? _location,
  jobType: jobType ?? _jobType,
  jobRole: jobRole ?? _jobRole,
  designation: designation ?? _designation,
  qua: qua ?? _qua,
  pYear: pYear ?? _pYear,
  cgpa: cgpa ?? _cgpa,
  otp: otp ?? _otp,
  keyskills: keyskills ?? _keyskills,
  aofs: aofs ?? _aofs,
  exp: exp ?? _exp,
  resume: resume ?? _resume,
  specialization: specialization ?? _specialization,
  veri: veri ?? _veri,
  img: img ?? _img,
  counter: counter ?? _counter,
  status: status ?? _status,
  token: token ?? _token,
  googleId: googleId ?? _googleId,
  profile: profile ?? _profile,
  insertDate: insertDate ?? _insertDate,
  ps2: ps2 ?? _ps2,
  age: age ?? _age,
  noticePeriod: noticePeriod ?? _noticePeriod,
  isProfileUpdated: isProfileUpdated ?? _isProfileUpdated,
);
  String? get id => _id;
  String? get name => _name;
  String? get surname => _surname;
  String? get email => _email;
  String? get city => _city;
  String? get hq => _hq;
  String? get yp => _yp;
  String? get mno => _mno;
  String? get ps => _ps;
  String? get gender => _gender;
  String? get current => _current;
  String? get expected => _expected;
  String? get currentAddress => _currentAddress;
  String? get location => _location;
  String? get jobType => _jobType;
  String? get jobRole => _jobRole;
  String? get designation => _designation;
  String? get qua => _qua;
  dynamic get pYear => _pYear;
  String? get cgpa => _cgpa;
  String? get otp => _otp;
  String? get keyskills => _keyskills;
  dynamic get aofs => _aofs;
  String? get exp => _exp;
  String? get resume => _resume;
  String? get specialization => _specialization;
  dynamic get veri => _veri;
  String? get img => _img;
  String? get counter => _counter;
  dynamic get status => _status;
  dynamic get token => _token;
  dynamic get googleId => _googleId;
  String? get profile => _profile;
  String? get insertDate => _insertDate;
  String? get ps2 => _ps2;
  String? get age => _age;
  String? get noticePeriod => _noticePeriod;
  String? get isProfileUpdated => _isProfileUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['surname'] = _surname;
    map['email'] = _email;
    map['city'] = _city;
    map['hq'] = _hq;
    map['yp'] = _yp;
    map['mno'] = _mno;
    map['ps'] = _ps;
    map['gender'] = _gender;
    map['current'] = _current;
    map['expected'] = _expected;
    map['current_address'] = _currentAddress;
    map['location'] = _location;
    map['job_type'] = _jobType;
    map['job_role'] = _jobRole;
    map['designation'] = _designation;
    map['qua'] = _qua;
    map['p_year'] = _pYear;
    map['cgpa'] = _cgpa;
    map['otp'] = _otp;
    map['keyskills'] = _keyskills;
    map['aofs'] = _aofs;
    map['exp'] = _exp;
    map['resume'] = _resume;
    map['specialization'] = _specialization;
    map['veri'] = _veri;
    map['img'] = _img;
    map['counter'] = _counter;
    map['status'] = _status;
    map['token'] = _token;
    map['google_id'] = _googleId;
    map['profile'] = _profile;
    map['insert_date'] = _insertDate;
    map['ps2'] = _ps2;
    map['age'] = _age;
    map['notice_period'] = _noticePeriod;
    map['is_profile_updated'] = _isProfileUpdated;
    return map;
  }

}