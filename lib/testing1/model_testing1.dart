class TestingModel1 {
  final int? id;
  final int? privilegeId;
  final String? name;
  final String? photo;
  final String? phone;
  final String? address;
  final String? email;

  TestingModel1({
    this.id,
    this.privilegeId,
    this.name,
    this.photo,
    this.phone,
    this.address,
    this.email,
  });

  factory TestingModel1.fromJson(Map<String, dynamic> json) => TestingModel1(
    id: json["id"] as int?,
    privilegeId: json["privilege_id"] as int?,
    name: json["name"] as String?,
    photo: json["photo"] as String?,
    phone: json["phone"] as String?,
    address: json["address"] as String?,
    email: json["email"] as String?,
  );
}
