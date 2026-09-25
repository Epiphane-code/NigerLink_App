class AddressModel {
  final int idVal;
  final String pays;
  final String ville;
  final String quartier;
  String get addressComplet => '$pays/$ville/$quartier';
  AddressModel({
    required this.idVal,
    required this.pays,
    required this.ville,
    required this.quartier,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      idVal: map['idVal'],
      pays: map['pays'],
      ville: map['ville'],
      quartier: map['quartier'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'pays': pays,
      'ville': ville,
      'quartier': quartier
    };
  }
}
