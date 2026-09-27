class CoordonneeLatLnt {
  final int idVal;
  final int addressIdVal;
  final String addressNomVal;
  final String categorie;
  final int nomId;
  final String latitude;
  final String longitude;
  CoordonneeLatLnt({
    required this.idVal,
    required this.addressIdVal,
    required this.addressNomVal,
    required this.categorie,
    required this.nomId,
    required this.latitude,
    required this.longitude,
  });
  factory CoordonneeLatLnt.fromMap(Map<String, dynamic> map) {
    return CoordonneeLatLnt(
      idVal: map['idVal'],
      addressIdVal: map['addressIdVal'],
      addressNomVal: map['addressNomVal'],
      categorie: map['categorie'],
      nomId: map['nomId'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'addressIdVal': addressIdVal,
      'addressNomVal': addressNomVal,
      'categorie': categorie,
      'nomId': nomId,
      'latitude': latitude,
      'longitude': longitude
    };
  }
}
