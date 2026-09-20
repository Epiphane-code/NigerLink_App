class HoraireModel {
  final int idVal;
  final String joursOuverts;
  final DateTime heureOuverture;
  final DateTime heureFermeture;
  final String demiJour;
  final String weekend;
  final DateTime heureFermetureDemijournee;
  HoraireModel({
    required this.idVal,
    required this.joursOuverts,
    required this.heureOuverture,
    required this.heureFermeture,
    required this.demiJour,
    required this.weekend,
    required this.heureFermetureDemijournee,
  });
}
