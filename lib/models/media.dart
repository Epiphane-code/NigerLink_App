class MediaModel {
  final int idVal;
  final String nomserviceVal;
  final String categorieVal;
  final String descriptionVal;
  final String motClesVal;
  final String? urlImage;

  MediaModel({
    required this.idVal,
    required this.nomserviceVal,
    required this.categorieVal,
    required this.descriptionVal,
    required this.motClesVal,
    this.urlImage
  });

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return MediaModel(
      idVal: map['idVal'],
      nomserviceVal: map['nomserviceVal'],
      categorieVal: map['categorieVal'],
      descriptionVal: map['descriptionVal'],
      motClesVal: map['motCles'],
      urlImage: map['urlImage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nomserviceVal': nomserviceVal,
      'categorieVal': categorieVal,
      'descriptionVal': descriptionVal,
      'motClesVal': motClesVal,
      'urlImage': urlImage
    };
  }
}
