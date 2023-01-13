class UserModel {
   String? userId, email, name, pic;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
  });
  UserModel.fromJson(Map<String,dynamic> map){
    userId = map["userId"];
    name = map["name"];
    email = map["email"];
    pic = map["pic"];
  }
  toJson(){
    return{
      'userId':userId,
      'name':name,
      'email':email,
      'pic':pic,
    };
  }
}