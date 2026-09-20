class CoordonneeLatLnt {
  final int idVal;
  final int addressIdVal;
  final String latitude;
  final String longitude;
  CoordonneeLatLnt({
    required this.idVal,
    required this.addressIdVal,
    required this.latitude,
    required this.longitude,
  });
  factory CoordonneeLatLnt.fromMap(Map<String, dynamic> map) {
    return CoordonneeLatLnt(
      idVal: map['idVal'],
      addressIdVal: map['addressIdVal'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
