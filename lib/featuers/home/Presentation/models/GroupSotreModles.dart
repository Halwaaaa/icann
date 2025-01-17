class GroupsotreModles {
  final String? name;
  final int? leader_id;
  final List<dynamic>? users;

  GroupsotreModles({
    required this.name,
    required this.leader_id,
    required this.users,
  });
  factory GroupsotreModles.fromJson(Map<String, dynamic> json) {
    return GroupsotreModles(
        name: json['name'], leader_id: json['leader_id'], users: json['users']);
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'leader_id': leader_id, "users": users};
  }
}
