class UserModel {
  String? uid;
  String? email;
  String? address;
  String? phone;
  String? name;

  UserModel({
    this.address,
    this.phone,
    this.name,
    this.uid,
    this.email,
  });

  // Factory constructor để tạo một đối tượng User từ một document snapshot
  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      address: data['address'],
      name: data['name'],
      phone: data['phone'],
    );
  }

  // Phương thức để chuyển đổi đối tượng User thành map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
    };
  }
}
