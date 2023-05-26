/// status : "true"
/// data : [{"id":"2","user_id":"207","job_id":"1","status":"0","created_at":"2023-01-20 13:03:53","updated_at":"2023-01-20 13:03:53","user":{"id":"207","name":"Helloworld ","surname":"user","email":"hello@gmail.com","city":"","hq":"","yp":"0","mno":"9999999999","ps":"25d55ad283aa400af464c76d713c07ad","gender":"male","current":"500000","expected":"8000000","current_address":"prince nagar indore ","location":"Hyderabad","job_type":"Full Time","job_role":"Engineering","designation":"Assistant Manager","qua":"B.E.","p_year":null,"cgpa":"70","otp":"5328","keyskills":"flutter, react","aofs":null,"exp":"6","resume":"uploads/resume/Invoice_173.pdf","specialization":"","veri":null,"img":"uploads/resume/image_picker3875998447375393162.jpg","counter":"0","status":"Active","token":null,"google_id":null,"profile":"","insert_date":"2023-01-20 10:26:31","ps2":"","age":"23","notice_period":"20","is_profile_updated":"1"},"job":{"id":"1","user_id":"68","job_type":"Full Time","designation":"Manager","qualification":"MBA/PGDM","passing_year":"2022","experience":"7+years","salary_range":"yearly","min":"100000.00","max":"500000.00","no_of_vaccancies":"5","job_role":"Financial Services","end_date":"2023-02-15","hiring_process":"Written test,Group Discussion,Technical Round,Face2Face","location":null,"description":null,"created_at":"2023-01-18 13:52:41","updated_at":"2023-01-18 13:58:26","rec_name":"archit deshmukh","company_name":"Hello World company"}},{"id":"3","user_id":"207","job_id":"3","status":"0","created_at":"2023-01-20 13:03:53","updated_at":"2023-01-20 13:03:53","user":{"id":"207","name":"Helloworld ","surname":"user","email":"hello@gmail.com","city":"","hq":"","yp":"0","mno":"9999999999","ps":"25d55ad283aa400af464c76d713c07ad","gender":"male","current":"500000","expected":"8000000","current_address":"prince nagar indore ","location":"Hyderabad","job_type":"Full Time","job_role":"Engineering","designation":"Assistant Manager","qua":"B.E.","p_year":null,"cgpa":"70","otp":"5328","keyskills":"flutter, react","aofs":null,"exp":"6","resume":"uploads/resume/Invoice_173.pdf","specialization":"","veri":null,"img":"uploads/resume/image_picker3875998447375393162.jpg","counter":"0","status":"Active","token":null,"google_id":null,"profile":"","insert_date":"2023-01-20 10:26:31","ps2":"","age":"23","notice_period":"20","is_profile_updated":"1"},"job":{"id":"3","user_id":"68","job_type":"Full Time","designation":"Manager","qualification":"MBA/PGDM","passing_year":"2022","experience":"7+years","salary_range":"yearly","min":"100000.00","max":"500000.00","no_of_vaccancies":"5","job_role":"Financial Services","end_date":"2023-02-15","hiring_process":"Written test,Group Discussion,Technical Round,Face2Face","location":" kushwaha nagar","description":" looking for good experience developer","created_at":"2023-01-19 06:22:17","updated_at":"2023-01-19 06:22:17","rec_name":"archit deshmukh","company_name":"Hello World company"}}]
/// message : "Job applied success"

class SeekerAppliedJob {
  SeekerAppliedJob({
      String? status, 
      List<Data>? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  SeekerAppliedJob.fromJson(dynamic json) {
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
SeekerAppliedJob copyWith({  String? status,
  List<Data>? data,
  String? message,
}) => SeekerAppliedJob(  status: status ?? _status,
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

/// id : "2"
/// user_id : "207"
/// job_id : "1"
/// status : "0"
/// created_at : "2023-01-20 13:03:53"
/// updated_at : "2023-01-20 13:03:53"
/// user : {"id":"207","name":"Helloworld ","surname":"user","email":"hello@gmail.com","city":"","hq":"","yp":"0","mno":"9999999999","ps":"25d55ad283aa400af464c76d713c07ad","gender":"male","current":"500000","expected":"8000000","current_address":"prince nagar indore ","location":"Hyderabad","job_type":"Full Time","job_role":"Engineering","designation":"Assistant Manager","qua":"B.E.","p_year":null,"cgpa":"70","otp":"5328","keyskills":"flutter, react","aofs":null,"exp":"6","resume":"uploads/resume/Invoice_173.pdf","specialization":"","veri":null,"img":"uploads/resume/image_picker3875998447375393162.jpg","counter":"0","status":"Active","token":null,"google_id":null,"profile":"","insert_date":"2023-01-20 10:26:31","ps2":"","age":"23","notice_period":"20","is_profile_updated":"1"}
/// job : {"id":"1","user_id":"68","job_type":"Full Time","designation":"Manager","qualification":"MBA/PGDM","passing_year":"2022","experience":"7+years","salary_range":"yearly","min":"100000.00","max":"500000.00","no_of_vaccancies":"5","job_role":"Financial Services","end_date":"2023-02-15","hiring_process":"Written test,Group Discussion,Technical Round,Face2Face","location":null,"description":null,"created_at":"2023-01-18 13:52:41","updated_at":"2023-01-18 13:58:26","rec_name":"archit deshmukh","company_name":"Hello World company"}

class Data {
  Data({
      String? id, 
      String? userId, 
      String? jobId, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      User? user, 
      Job? job,}){
    _id = id;
    _userId = userId;
    _jobId = jobId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _job = job;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _jobId = json['job_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _job = json['job'] != null ? Job.fromJson(json['job']) : null;
  }
  String? _id;
  String? _userId;
  String? _jobId;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  User? _user;
  Job? _job;
Data copyWith({  String? id,
  String? userId,
  String? jobId,
  String? status,
  String? createdAt,
  String? updatedAt,
  User? user,
  Job? job,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  jobId: jobId ?? _jobId,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
  job: job ?? _job,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get jobId => _jobId;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  User? get user => _user;
  Job? get job => _job;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['job_id'] = _jobId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_job != null) {
      map['job'] = _job?.toJson();
    }
    return map;
  }

}

/// id : "1"
/// user_id : "68"
/// job_type : "Full Time"
/// designation : "Manager"
/// qualification : "MBA/PGDM"
/// passing_year : "2022"
/// experience : "7+years"
/// salary_range : "yearly"
/// min : "100000.00"
/// max : "500000.00"
/// no_of_vaccancies : "5"
/// job_role : "Financial Services"
/// end_date : "2023-02-15"
/// hiring_process : "Written test,Group Discussion,Technical Round,Face2Face"
/// location : null
/// description : null
/// created_at : "2023-01-18 13:52:41"
/// updated_at : "2023-01-18 13:58:26"
/// rec_name : "archit deshmukh"
/// company_name : "Hello World company"

class Job {
  Job({
      String? id, 
      String? userId, 
      String? jobType, 
      String? designation, 
      String? qualification, 
      String? passingYear, 
      String? experience, 
      String? salaryRange, 
      String? min, 
      String? max,
      String? specialization,
      String? noOfVaccancies, 
      String? jobRole, 
      String? endDate, 
      String? hiringProcess, 
      dynamic location, 
      dynamic description, 
      String? createdAt, 
      String? updatedAt, 
      String? recName, 
      String? companyName,}){
    _id = id;
    _userId = userId;
    _jobType = jobType;
    _designation = designation;
    _qualification = qualification;
    _passingYear = passingYear;
    _experience = experience;
    _specialization = specialization;
    _salaryRange = salaryRange;
    _min = min;
    _max = max;
    _noOfVaccancies = noOfVaccancies;
    _jobRole = jobRole;
    _endDate = endDate;
    _hiringProcess = hiringProcess;
    _location = location;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _recName = recName;
    _companyName = companyName;
}

  Job.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _jobType = json['job_type'];
    _designation = json['designation'];
    _qualification = json['qualification'];
    _passingYear = json['passing_year'];
    _experience = json['experience'];
    _salaryRange = json['salary_range'];
    _specialization = json['specialization'];
    _min = json['min'];
    _max = json['max'];
    _noOfVaccancies = json['no_of_vaccancies'];
    _jobRole = json['job_role'];
    _endDate = json['end_date'];
    _hiringProcess = json['hiring_process'];
    _location = json['location'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _recName = json['rec_name'];
    _companyName = json['company_name'];
  }
  String? _id;
  String? _userId;
  String? _jobType;
  String? _designation;
  String? _qualification;
  String? _passingYear;
  String? _experience;
  String? _salaryRange;
  String? _min;
  String? _max;
  String? _noOfVaccancies;
  String? _specialization;
  String? _jobRole;
  String? _endDate;
  String? _hiringProcess;
  dynamic _location;
  dynamic _description;
  String? _createdAt;
  String? _updatedAt;
  String? _recName;
  String? _companyName;
Job copyWith({  String? id,
  String? userId,
  String? jobType,
  String? designation,
  String? qualification,
  String? passingYear,
  String? experience,
  String? salaryRange,
  String? min,
  String? max,
  String? noOfVaccancies,
  String? jobRole,
  String? endDate,
  String? hiringProcess,
  String? specialization,
  dynamic location,
  dynamic description,
  String? createdAt,
  String? updatedAt,
  String? recName,
  String? companyName,
}) => Job(  id: id ?? _id,
  userId: userId ?? _userId,
  jobType: jobType ?? _jobType,
  designation: designation ?? _designation,
  qualification: qualification ?? _qualification,
  passingYear: passingYear ?? _passingYear,
  experience: experience ?? _experience,
  salaryRange: salaryRange ?? _salaryRange,
  min: min ?? _min,
  max: max ?? _max,
  specialization : specialization ?? _specialization,
  noOfVaccancies: noOfVaccancies ?? _noOfVaccancies,
  jobRole: jobRole ?? _jobRole,
  endDate: endDate ?? _endDate,
  hiringProcess: hiringProcess ?? _hiringProcess,
  location: location ?? _location,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  recName: recName ?? _recName,
  companyName: companyName ?? _companyName,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get jobType => _jobType;
  String? get designation => _designation;
  String? get qualification => _qualification;
  String? get passingYear => _passingYear;
  String? get experience => _experience;
  String? get specialization => _specialization;
  String? get salaryRange => _salaryRange;
  String? get min => _min;
  String? get max => _max;
  String? get noOfVaccancies => _noOfVaccancies;
  String? get jobRole => _jobRole;
  String? get endDate => _endDate;
  String? get hiringProcess => _hiringProcess;
  dynamic get location => _location;
  dynamic get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get recName => _recName;
  String? get companyName => _companyName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['job_type'] = _jobType;
    map['designation'] = _designation;

    map['qualification'] = _qualification;
    map['passing_year'] = _passingYear;
    map['experience'] = _experience;
    map['salary_range'] = _salaryRange;
    map['min'] = _min;
    map['max'] = _max;
    map['specialization'] = _specialization;
    map['no_of_vaccancies'] = _noOfVaccancies;
    map['job_role'] = _jobRole;
    map['end_date'] = _endDate;
    map['hiring_process'] = _hiringProcess;
    map['location'] = _location;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['rec_name'] = _recName;
    map['company_name'] = _companyName;
    return map;
  }

}

/// id : "207"
/// name : "Helloworld "
/// surname : "user"
/// email : "hello@gmail.com"
/// city : ""
/// hq : ""
/// yp : "0"
/// mno : "9999999999"
/// ps : "25d55ad283aa400af464c76d713c07ad"
/// gender : "male"
/// current : "500000"
/// expected : "8000000"
/// current_address : "prince nagar indore "
/// location : "Hyderabad"
/// job_type : "Full Time"
/// job_role : "Engineering"
/// designation : "Assistant Manager"
/// qua : "B.E."
/// p_year : null
/// cgpa : "70"
/// otp : "5328"
/// keyskills : "flutter, react"
/// aofs : null
/// exp : "6"
/// resume : "uploads/resume/Invoice_173.pdf"
/// specialization : ""
/// veri : null
/// img : "uploads/resume/image_picker3875998447375393162.jpg"
/// counter : "0"
/// status : "Active"
/// token : null
/// google_id : null
/// profile : ""
/// insert_date : "2023-01-20 10:26:31"
/// ps2 : ""
/// age : "23"
/// notice_period : "20"
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
      String? status, 
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
  String? _status;
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
  String? status,
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
  String? get status => _status;
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