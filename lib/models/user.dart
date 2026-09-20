class UserModel {
  final int? idVal;
  final String? roleVal;
  final String nomVal;
  final String prenomVal;
  final String? emailVal;
  final String telephoneVal;
  final int? addressIdVal;
  final String? proffessionVal;
  final String? passwordVal;
  UserModel({
    this.idVal,
    this.roleVal,
    required this.nomVal,
    required this.prenomVal,
    required this.emailVal,
    required this.telephoneVal,
    this.addressIdVal,
    this.proffessionVal,
    this.passwordVal,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      idVal: map['idVal'],
      roleVal: map['roleVal'],
      nomVal: map['nomVal'],
      prenomVal: map['prenomVal'],
      emailVal: map['emailVal'],
      telephoneVal: map['telephoneVal'],
      addressIdVal: map['addressIdVal'],
      proffessionVal: map['proffessionVal'],
    );
  }

  Map<String, dynamic> newUsertoMap(UserModel user) {
    return {
      'nomVal': user.idVal,
      'prenomVal': user.prenomVal,
      'telephoneVal': user.telephoneVal,
      'addressIdVal': user.addressIdVal,
      'proffessionVal': user.proffessionVal,
      'passwordVal': user.passwordVal
    };
  }
}
