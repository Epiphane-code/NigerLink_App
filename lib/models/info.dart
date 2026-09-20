class InfoModel {
  final int idVal;
  final String nomserviceVal;
  final String title;
  final String contenuVal;
  final String motClesVal;

  InfoModel({
    required this.idVal,
    required this.title,
    required this.nomserviceVal,
    required this.contenuVal,
    required this.motClesVal,
  });

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      idVal: map['idVal'],
      title: map['title'],
      nomserviceVal: map['nomserviceVal'],
      contenuVal: map['contenuVal'],
      motClesVal: map['motCles'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'nomserviceVal': nomserviceVal,
      'descriptionVal': contenuVal,
      'motClesVal': motClesVal,
    };
  }
}
