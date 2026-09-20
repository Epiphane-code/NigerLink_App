class AddressModel {
  final int idVal;
  final String pays;
  final String ville;
  final String quartier;
  final String rue;
  String get addressComplet => '$pays/$ville/$quartier/$rue';
  AddressModel({required this.idVal, required this.pays, required this.ville, required this.quartier, required this.rue});
}
