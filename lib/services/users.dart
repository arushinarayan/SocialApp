class User {
  final String uid;
  final String Name;
  final String email;

  User({this.uid, this.Name, this.email});

  User.fromData(Map<String, dynamic> data)
      : uid = data['id'],
        Name = data['Name'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'Name': Name,
      'email': email,
    };
  }
}
