class User {
  int? userid;
  String? usernama;
  String? password;
  String? useremail;
  String? token;
  String? tokenExpireDate;

  User(
      {this.userid,
      this.usernama,
      this.password,
      this.useremail,
      this.token,
      this.tokenExpireDate});

  User.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    usernama = json['usernama'];
    password = json['password'];
    useremail = json['useremail'];
    token = json['token'];
    tokenExpireDate = json['token_expire_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['usernama'] = usernama;
    data['password'] = password;
    data['useremail'] = useremail;
    data['token'] = token;
    data['token_expire_date'] = tokenExpireDate;
    return data;
  }
}
