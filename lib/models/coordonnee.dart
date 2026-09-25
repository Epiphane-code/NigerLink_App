class CoordonneeLatLnt {
  final int idVal;
  final int addressIdVal;
  final int nomId;
  final String latitude;
  final String longitude;
  CoordonneeLatLnt({
    required this.idVal,
    required this.addressIdVal,
    required this.nomId,
    required this.latitude,
    required this.longitude,
  });
  factory CoordonneeLatLnt.fromMap(Map<String, dynamic> map) {
    return CoordonneeLatLnt(
      idVal: map['idVal'],
      addressIdVal: map['addressIdVal'],
      nomId: map['nomId'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'addressIdVal': addressIdVal,
      'nomId': nomId,
      'latitude': latitude,
      'longitude': longitude
    };
  }
}
