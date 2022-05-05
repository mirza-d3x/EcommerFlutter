/// id : 6
/// name : "Person"
/// email : "person2@example.com"
/// password : "person2"
/// user_img : "person2.jpg"

class SignupUserModel {
  SignupUserModel({
      int? id, 
      String? name, 
      String? email, 
      String? password, 
      String? userImg,}){
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _userImg = userImg;
}

  SignupUserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _userImg = json['user_img'];
  }
  int? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _userImg;
SignupUserModel copyWith({  int? id,
  String? name,
  String? email,
  String? password,
  String? userImg,
}) => SignupUserModel(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  userImg: userImg ?? _userImg,
);
  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get userImg => _userImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['user_img'] = _userImg;
    return map;
  }

}