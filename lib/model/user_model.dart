class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;

  UserModel({this.uid, this.email, this.firstName, this.lastName, mobile});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      mobile: map['mobile'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
    };
  }
}
