class UserProfile {
  int? id;
  String? firstName;
  String? lastName;
  bool? isSuperuser;
  String? username;
  String? password;
  String? email;
  bool? isStaff;
  bool? isActive;
  String? position;
  String? imgProfile;

  UserProfile(
      {this.id,
      this.firstName,
      this.lastName,
      this.isSuperuser,
      this.username,
      this.password,
      this.email,
      this.isStaff,
      this.isActive,
      this.position,
      this.imgProfile});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    position = json['position'];
    imgProfile = json['imgProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['is_superuser'] = this.isSuperuser;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['is_staff'] = this.isStaff;
    data['is_active'] = this.isActive;
    data['position'] = this.position;
    data['imgProfile'] = this.imgProfile;
    return data;
  }
}
