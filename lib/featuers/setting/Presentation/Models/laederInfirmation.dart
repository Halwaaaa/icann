class LeaderWithDetails {
  final String? name;

  final String? username;

  final dynamic mobileNo;

  final String? password;

  final int? countryId;

  final int? stateId;

  final int? cityId;

  final String? address;

  final int? status;

  final String? note;

  LeaderWithDetails({
    required this.name,
    required this.username,
    required this.mobileNo,
    required this.password,
    required this.countryId,
    required this.stateId,
    this.cityId,
    required this.address,
    required this.status,
    required this.note,
  });

  // لتحويل JSON إلى كائن
  factory LeaderWithDetails.fromJson(Map<String, dynamic> json) {
    return LeaderWithDetails(
      name: json['name'],
      username: json['username'],
      mobileNo: json['mobile_no'],
      password: json['password'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      cityId: json['city_id'],
      address: json['address'],
      status: json['status'],
      note: json['note'],
    );
  }

  // لتحويل كائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'mobile_no': mobileNo,
      'password': password,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'address': address,
      'status': status,
      'note': note,
    };
  }
}
