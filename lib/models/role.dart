enum Role { admin, superAdmin, citoyen }

class RoleModel {
  final int idVal;
  final Role roleVal;
  final String libelleVal;
  RoleModel({
    required this.idVal,
    required this.roleVal,
    required this.libelleVal,
  });

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      idVal: map['idVal'],
      roleVal: map['roleVal'],
      libelleVal: map['libelleVal'],
    );
  }
}
