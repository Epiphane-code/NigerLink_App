class VideoModel {
  final int idVal;
  final int serviceIdVal;
  final String titreVal;
  final String urlVideoVal;
  final String motCles;
  VideoModel({
    required this.idVal,
    required this.titreVal,
    required this.serviceIdVal,
    required this.motCles,
    required this.urlVideoVal,
  });

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      idVal: map['idVal'],
      titreVal: map['titreVal'],
      serviceIdVal: map['serviceIdVal'],
      motCles: map['motCles'],
      urlVideoVal: map['urlVideoVal'],
    );
  }

  Map<String, dynamic> toMap(VideoModel){
    return {
      'titreVal': titreVal,
      'serviceIdVal': serviceIdVal,
      'motCles': motCles,
      'urlVideoVal': urlVideoVal
    };
  }
}
