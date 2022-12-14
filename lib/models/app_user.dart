class AppUser {
  String? email;
  String? id;
  String? userName;
  String? phoneNumber;
  String? imageUrl;

  AppUser(
      {this.id,
      this.imageUrl,
      required this.email,
      required this.userName,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {'email': email, 'userName': userName, 'phoneNumber': phoneNumber};
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
        email: map['email'] ?? '',
        userName: map['userName'] ?? '',
        imageUrl: map['imageUrl'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '');
  }
}
